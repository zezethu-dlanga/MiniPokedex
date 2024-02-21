//
//  StringExtension.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/22.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
