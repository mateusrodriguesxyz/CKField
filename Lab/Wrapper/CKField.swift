//
//  CKField.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import CloudKit

@propertyWrapper
public struct CKField<Value: CKFieldProtocol> {
    
    public typealias W<Root> = ReferenceWritableKeyPath<Root, Value>
    public typealias S<Root> = ReferenceWritableKeyPath<Root, CKField>
    
    private var key: String
    
    private var cached: Value?
    
    public init(key: String) {
        self.key = key
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
                let value = Value.get(record[key])
                instance[keyPath: storageKeyPath].cached = value
                return value!
            case .some(let value):
                return value
            }
        }
        set {
            let _self = instance[keyPath: storageKeyPath]
            
            let key = _self.key
            let record = instance.record
            
            instance[keyPath: storageKeyPath].cached = newValue
            record[key] = Value.set(newValue)
        }
    }
    
}
