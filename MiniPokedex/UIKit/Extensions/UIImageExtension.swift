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
}
