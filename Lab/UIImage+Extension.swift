//
//  UIImage+Extension.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit
import CloudKit

extension UIImage: CKFieldProtocol {
    
    public static func get(_ value: CKRecordValue?) -> Self? {
        guard let asset = value as? CKAsset, let url = asset.fileURL else { return nil }
        guard let data = FileManager.default.contents(atPath: url.path) else { return nil }
        return UIImage(data: data) as? Self
    }
    
    public static func set(_ value: UIImage?) -> CKRecordValue? {
        guard let url = value?.url else { return nil }
        return CKAsset(fileURL: url)
    }
    
    var url: URL? {
        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(UUID().uuidString)
        guard self.write(to: url) else { return nil }
        return url
    }
    
    func write(to url: URL) -> Bool {
        guard let data = self.pngData() else { return false }
        do {
            try data.write(to: url)
            return true
        } catch {
            return false
        }
    }
    
}
