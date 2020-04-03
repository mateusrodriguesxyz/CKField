//
//  User.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit
import CloudKit

enum Role: String {
    case student
    case teacher
}

extension Role: CKFieldProtocol {
    static func get(_ value: CKRecordValue?) -> Role? {
        return Role(rawValue: value as! String)
    }
    
    static func set(_ value: Role?) -> CKRecordValue? {
        return value?.rawValue as CKRecordValue?
    }
}

extension UIImage: CKFieldProtocol {
    
    public static func get(_ value: CKRecordValue?) -> Self? {
        guard let asset = value as? CKAsset, let data = asset.data else { return nil }
        return UIImage(data: data) as? Self
    }
    
    public static func set(_ value: UIImage?) -> CKRecordValue? {
        guard let url = value?.url else { return nil }
        return CKAsset(fileURL: url)
    }
    
}

class User: CKModel {
    
    var record: CKRecord
    
    @CKField(key: "name")
    var name: String?

    @CKField(key: "photo")
    var image: UIImage?
    
    @CKField(key: "role")
    var role: Role
    
    init(record: CKRecord) {
        self.record = record
    }
    
}
