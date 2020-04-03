//
//  CKFieldProtocol.swift
//  Lab
//
//  Created by Mateus Rodrigues on 03/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit

public protocol CKFieldProtocol {
    static func get(_ value: CKRecordValue?) -> Self?
    static func set(_ value: Self?) -> CKRecordValue?
}

extension Optional: CKFieldProtocol where Wrapped: CKFieldProtocol {
    public static func get(_ value: CKRecordValue?) -> Optional<Wrapped>? {
        return Wrapped.get(value)
    }
    public static func set(_ value: Optional<Wrapped>?) -> CKRecordValue? {
        return Wrapped.set(value!)
    }
}

extension CKFieldProtocol where Self: CKRecordValueProtocol {
    public static func get(_ value: CKRecordValue?) -> Self? {
        return value as? Self
    }
    public static func set(_ value: Self?) -> CKRecordValue? {
        return value as? CKRecordValue
    }
}

extension String: CKFieldProtocol {}
extension Date: CKFieldProtocol {}
extension Data: CKFieldProtocol {}
extension Bool: CKFieldProtocol {}
extension Int: CKFieldProtocol {}
extension Double: CKFieldProtocol {}
