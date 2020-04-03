//
//  CKModel.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit
import CloudKit

public protocol CKModel {
    var record: CKRecord { get }
}

extension CKModel {
    var id: CKRecord.ID {
        return record.recordID
    }
}
