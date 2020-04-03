//
//  User.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit
import CloudKit

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
