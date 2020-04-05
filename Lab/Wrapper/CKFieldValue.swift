//
//  CKFieldProtocol.swift
//  Lab
//
//  Created by Mateus Rodrigues on 03/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit

public protocol CKFieldValue {
    static func get(_ value: CKRecordValue?) -> Self?
    static func set(_ value: Self?) -> CKRecordValue?
}

extension Optional: CKFieldValue where Wrapped: CKFieldValue {
    public static func get(_ value: CKRecordValue?) -> Self? {
        return Wrapped.get(value)
    }
    public static func set(_ value: Self?) -> CKRecordValue? {
        return Wrapped.set(value!)
    }
}

extension CKFieldValue where Self: CKRecordValueProtocol {
    public static func get(_ value: CKRecordValue?) -> Self? {
        return value as? Self
    }
    public static func set(_ value: Self?) -> CKRecordValue? {
        return value as? CKRecordValue
    }
}

extension String: CKFieldValue {}
extension Date: CKFieldValue {}
extension Data: CKFieldValue {}
extension Bool: CKFieldValue {}
extension Int: CKFieldValue {}
extension Double: CKFieldValue {}
