//
//  ViewController.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var user = User(record: CKRecord(recordType: "User"))
    
    let image = UIImage(named: "mateus")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        user.record["name"] = nil
        user.record["photo"] = CKAsset(fileURL: image.url!)
        user.record["role"] = "teacher"
        
        
        imageView.image = user.image
        
        print(user.name)
        print(user.photo)
        print(user.role)
        
//        
//        let a = user.record["name"]
//        
//        imageView.image = user.image2
//
//
//        let start1 = CFAbsoluteTimeGetCurrent()
////
//        for _ in 0...1000 {
//            let photo = user.photo!
//        }
////
//        let end1 = CFAbsoluteTimeGetCurrent()
////
//        print("loaded", user.photo)
//        print("loaded", end1-start1)
//
//        let start2 = CFAbsoluteTimeGetCurrent()
//
//        for _ in 0...1000 {
//            let photo = user._photo!.image!
//        }
//
//        let end2 = CFAbsoluteTimeGetCurrent()
//
//        print("ckfield", user._photo?.image)
//        print("ckfield", end2-start2)
//
//
//        let start3 = CFAbsoluteTimeGetCurrent()
//
//        for _ in 0...1000 {
//            let photo = (user.record["photo"] as? CKAsset)!.image!
//        }
//
//        let end3 = CFAbsoluteTimeGetCurrent()
//
//        print("record", (user.record["photo"] as? CKAsset)?.image)
//        print("record", end3-start3)
//
//        let start4 = CFAbsoluteTimeGetCurrent()
//
//        for _ in 0...1000 {
//            let photo = user.image
//            if photo == nil {
//                print("NIL")
//            }
//        }
//
//        let end4 = CFAbsoluteTimeGetCurrent()
//
//        print("ckimage", user.image)
//        print("ckimage", end4-start4)
//
//        print(user.loadedPhoto)
        
        
    }


}

