//
//  Role+Extension.swift
//  Lab
//
//  Created by Mateus Rodrigues on 03/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit

extension Role: CKFieldProtocol {
    static func get(_ value: CKRecordValue?) -> Role? {
        return Role(rawValue: value as! String)
    }
    
    static func set(_ value: Role?) -> CKRecordValue? {
        return value?.rawValue as CKRecordValue?
    }
}
