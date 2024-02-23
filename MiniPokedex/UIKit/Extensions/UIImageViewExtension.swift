//
//  UIImageViewExtension.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/23.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(using url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
