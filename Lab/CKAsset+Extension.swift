//
//  CKAsset+Extension.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit
import CloudKit

extension CKAsset {
    
    var data: Data? {
        guard let url = self.fileURL else { return nil }
        return FileManager.default.contents(atPath: url.path)
    }
    
    var image: UIImage? {
        guard let data = self.data else { return nil }
        return UIImage(data: data)
    }
}
