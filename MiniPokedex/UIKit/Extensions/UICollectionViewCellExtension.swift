//
//  UICollectionViewCellExtension.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/21.
//

import Foundation
import UIKit

public extension UICollectionViewCell {
    static var defaultReuseIdentifier: String {
        NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}

public extension UITableViewCell {
    static var defaultReuseIdentifier: String {
        NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
