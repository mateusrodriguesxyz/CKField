//
//  UIImage+Extension.swift
//  Lab
//
//  Created by Mateus Rodrigues on 17/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

extension UIImage {
    
    var data: Data? {
        return self.pngData()
    }
    
    var url: URL? {
        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(UUID().uuidString)
        guard self.write(to: url) else { return  nil }
        return url
    }
    
    func write(to url: URL) -> Bool {
        guard let data = self.data else { return false }
        do {
            try data.write(to: url)
            return true
        } catch {
            return false
        }
    }
    
}
