//
//  StringExtension.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/22.
//

import Foundation

extension String {
    
    var allNumbers: [Int] {
    let numbersInString = self.components(separatedBy: .decimalDigits.inverted).filter { !$0.isEmpty }
        return numbersInString.compactMap { Int($0) }
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

}


extension String {
    
}
