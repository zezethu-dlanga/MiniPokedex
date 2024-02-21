//
//  ArrayExtension.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/21.
//

import Foundation

extension Array {
    func element(at index: Index) -> Element? {
        guard indices.contains(index) else {
            return nil
        }
        return self[index]
    }
}
