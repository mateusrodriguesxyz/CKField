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

//    @CKField(key: "photo")
//    var _photo: CKAsset?
    
    @CKField(key: "name")
    var name: String?
    
    @CKImage(key: "photo")
    var image: UIImage?
    
    @CKField(key: "photo")
    var image2: UIImage?
    
//    var photo: UIImage? {
//        get {
//            if let photo = loadedPhoto {
//                return photo
//            } else {
//                let photo = _photo?.image
//                self.loadedPhoto = photo
//                return photo
//            }
//        }
//        set {
//            guard let image = newValue, let url = image.url else { return }
//            _photo = CKAsset(fileURL: url)
//            loadedPhoto = image
//        }
//    }
    
    var photo: UIImage? {
        get {
            if let photo = loadedPhoto {
                return photo
            } else {
                let photo = (record["photo"] as? CKAsset)?.image
                self.loadedPhoto = photo
                return photo
            }
        }
        set {
            guard let image = newValue, let url = image.url else { return }
            record["photo"] = CKAsset(fileURL: url)
            loadedPhoto = image
        }
    }
    
    var loadedPhoto: UIImage?
    
    init(record: CKRecord) {
        self.record = record
    }
    
}
