//
//  LabTests.swift
//  LabTests
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import XCTest
import CloudKit
@testable import Lab

class LabTests: XCTestCase {
    
    var user = User(record: CKRecord(recordType: "User"))
    
    let image = UIImage(named: "mateus")!

    override func setUp() {
        user.record["photo"] = CKAsset(fileURL: image.url!)
    }

    override func tearDown() {
        user.record["photo"] = nil
    }
    
    func testRecord() {
        measure {
            for _ in 0...1000 {
                _ = (user.record["photo"] as? CKAsset)?.image
            }
        }
    }
    
    func testLoaded() {
        measure {
            for _ in 0...1000 {
                _ = user.photo
            }
        }
    }
    
    func testCKField() {
        measure {
            for _ in 0...1000 {
                _ = user.image2
            }
        }
    }
    
    func testCKImage() {
        measure {
            for _ in 0...1000 {
                _ = user.image
            }
        }
    }

    //    func testCKField() {
    //        measure {
    //            for _ in 0...1000 {
    //                _ = user._photo!.image!
    //            }
    //        }
    //    }
    
}
