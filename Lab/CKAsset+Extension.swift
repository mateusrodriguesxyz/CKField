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
    var image: UIImage? {
        guard let url = self.fileURL else { return nil }
        guard let data = FileManager.default.contents(atPath: url.path) else { return nil }
        return UIImage(data: data)
    }
}
