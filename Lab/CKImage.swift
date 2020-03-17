//
//  CKImage.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit
import CloudKit

@propertyWrapper
struct CKImage {
    
    private let key: String
    
    private var image: UIImage?

    public init(key: String) {
        self.key = key
    }

    var wrappedValue: UIImage? {
        get { fatalError() }
        set { fatalError() }
    }
    
    typealias W<Root> = ReferenceWritableKeyPath<Root, UIImage?>
    typealias S<Root> = ReferenceWritableKeyPath<Root, CKImage>
    
    public static subscript<T: CKModel>(_enclosingInstance instance: T, wrapped wrappedKeyPath: W<T>, storage storageKeyPath: S<T>) -> UIImage? {
        get {
            if let image = instance[keyPath: storageKeyPath].image {
                return image
            } else {
                let key = instance[keyPath: storageKeyPath].key
                let asset = instance.record[key] as? CKAsset
                let image = asset?.image
                instance[keyPath: storageKeyPath].image = image
                return image
            }
        }
        set {
            if let url = newValue?.url {
                let key = instance[keyPath: storageKeyPath].key
                instance[keyPath: storageKeyPath].image = newValue
                instance.record[key] = CKAsset(fileURL: url)
                
            }
        }
    }
    
}
