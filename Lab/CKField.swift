//
//  CKField.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import CloudKit

extension Optional: CKRecordValueProtocol where Wrapped: CKRecordValueProtocol {}

@propertyWrapper
public struct CKField<Value> {
    
    public typealias Getter = (CKRecordValue) -> Value
    public typealias Setter = (Value) -> CKRecordValue
    
    public typealias W<Root> = ReferenceWritableKeyPath<Root, Value>
    public typealias S<Root> = ReferenceWritableKeyPath<Root, CKField>
    
    private var key: String
    
    private var get: Getter?
    private var set: Setter?
    
    private var cached: Value?
    
    public init(key: String, get: @escaping Getter, set: @escaping Setter) {
        self.key = key
        self.get = get
        self.set = set
    }

    public var wrappedValue: Value {
        get { fatalError() }
        set { fatalError() }
    }
    
    public static subscript<T: CKModel>(_enclosingInstance instance: T, wrapped wrappedKeyPath: W<T>, storage storageKeyPath: S<T>) -> Value {
        get {
            
            let _self = instance[keyPath: storageKeyPath]
            
            let key = _self.key
            let record = instance.record
            
            switch _self.cached {
            case .none:
                if let get = _self.get {
                    let value = get(record[key]!)
                    instance[keyPath: storageKeyPath].cached = value
                    return value
                } else {
                    let value = record[key] as! Value
                    instance[keyPath: storageKeyPath].cached = value
                    return value
                }
            case .some(let value):
                return value
            }
    
        }
        set {
            
            let _self = instance[keyPath: storageKeyPath]
            
            let key = _self.key
            let record = instance.record
            
            if let set = _self.set {
                instance[keyPath: storageKeyPath].cached = newValue
                record[key] = set(newValue)
            } else {
                instance[keyPath: storageKeyPath].cached = newValue
                record[key] = newValue as? CKRecordValue
            }
            
        }
    }
    
}

extension CKField where Value: CKRecordValueProtocol {
    
    public init(key: String) {
        self.key = key
    }
    
}
