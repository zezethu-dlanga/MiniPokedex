//
//  UIImageExtension.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/21.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        
        do {
            self.init(data: try Data(contentsOf: url))
        } catch {
            fatalError("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
    
    public convenience init?(bounds: CGRect, colors: [UIColor], orientation: GradientOrientation = .horizontal) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map({ $0.cgColor })
        
        if orientation == .horizontal {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5);
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5);
        }
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

public enum GradientOrientation {
    case vertical
    case horizontal
}
