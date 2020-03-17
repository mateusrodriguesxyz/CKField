//
//  CKField.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import CloudKit

@propertyWrapper
struct CKField<Value> {
    
    private let key: String

    public init(key: String) {
        self.key = key
    }

    var wrappedValue: Value {
        get { fatalError() }
        set { fatalError() }
    }
    
    typealias W<Root> = ReferenceWritableKeyPath<Root, Value>
    typealias S<Root> = ReferenceWritableKeyPath<Root, CKField>
    
    public static subscript<T: CKModel>(_enclosingInstance instance: T, wrapped wrappedKeyPath: W<T>, storage storageKeyPath: S<T>) -> Value {
        get {
            let key = instance[keyPath: storageKeyPath].key
            let record = instance.record
            return record[key] as! Value
        }
        set {
            let key = instance[keyPath: storageKeyPath].key
            let record = instance.record
            record[key] = newValue as? CKRecordValue
        }
    }
    
//    public static subscript<T: CKModel>(_enclosingInstance instance: T, wrapped wrappedKeyPath: W<T>, storage storageKeyPath: S<T>) -> Value {
//        get {
//            let key = instance[keyPath: storageKeyPath].key
//            let record = instance.record
//            return record[key] as! Value
//        }
//        set {
//            let key = instance[keyPath: storageKeyPath].key
//            let record = instance.record
//            record[key] = newValue as? CKRecordValue
//        }
//    }
    
}
