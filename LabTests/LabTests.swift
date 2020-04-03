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

struct EmptyStruct {
    private let number: Int64 = 1
    //Empty classes have 64bits of storage by default for the pointer
    //so we're adding 64bits to our struct to make fair comparisons.
}

final class EmptyClass {}

struct HugeDynamicStruct {
    var emptyClass = EmptyClass()
    var emptyClass2 = EmptyClass()
    var emptyClass3 = EmptyClass()
    var emptyClass4 = EmptyClass()
    var emptyClass5 = EmptyClass()
    var emptyClass6 = EmptyClass()
    var emptyClass7 = EmptyClass()
    var emptyClass8 = EmptyClass()
    var emptyClass9 = EmptyClass()
    var emptyClass10 = EmptyClass()
}

class HugeClass {
    var emptyClass = EmptyClass()
    var emptyClass2 = EmptyClass()
    var emptyClass3 = EmptyClass()
    var emptyClass4 = EmptyClass()
    var emptyClass5 = EmptyClass()
    var emptyClass6 = EmptyClass()
    var emptyClass7 = EmptyClass()
    var emptyClass8 = EmptyClass()
    var emptyClass9 = EmptyClass()
    var emptyClass10 = EmptyClass()
}

class LabTests: XCTestCase {
    
    var user = User(record: CKRecord(recordType: "User"))
    
    let image = UIImage(named: "mateus")!

    override func setUp() {
        user.record["photo"] = CKAsset(fileURL: image.url!)
    }

    override func tearDown() {
        user.record["photo"] = nil
    }
    
    func testStruct() {
        measure {
            createABunchOfCopiesOfStruct()
        }
    }
    
    func testClass() {
        measure {
            createABunchOfReferencesOfClass()
        }
    }
    
    func createABunchOfReferencesOfClass() {
        var array = [HugeClass]()
        let object = HugeClass()
        for _ in 0..<10_000_000 {
            array.append(object)
        }
    }
    
    func createABunchOfCopiesOfStruct() {
        var array = [HugeDynamicStruct]()
        let object = HugeDynamicStruct()
        for _ in 0..<10_000_000 {
            array.append(object)
        }
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
                _ = user.image
            }
        }
    }
    
    //    func testCKField() {
    //        measure {
    //            for _ in 0...1000 {
    //                _ = user.image2
    //            }
    //        }
    //    }

    //    func testCKField() {
    //        measure {
    //            for _ in 0...1000 {
    //                _ = user._photo!.image!
    //            }
    //        }
    //    }
    
}
