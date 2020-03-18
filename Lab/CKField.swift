//
//  CKField.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import CloudKit
import UIKit

@propertyWrapper
class CKField<Value> {
    
    private let key: String
    
    private var cached: UIImage?

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
            let _self = instance[keyPath: storageKeyPath]
            let key = _self.key
            let record = instance.record
            if let image = _self.cached {
                return image as! Value
            } else {
                if let asset = record[key] as? CKAsset {
                    let image = asset.image
                    instance[keyPath: storageKeyPath].cached = image
                    return image as! Value
                } else {
                    return record[key] as! Value
                }
            }
        }
        set {
            let _self = instance[keyPath: storageKeyPath]
            let key = _self.key
            let record = instance.record
            if let image = newValue as? UIImage, let url = image.url {
                _self.cached = image
                record[key] = CKAsset(fileURL: url)
            } else {
                record[key] = newValue as? CKRecordValue
            }
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
