//
//  PokemonInfoViewModel.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/22.
//

import Foundation

struct PokemonInfoViewModel {
    let name: String
    let picture: String
    let height: String
    let weight: String
    let abilities: String
    let types: String
    

    init(name: String, picture: String, height: String, weight: String, abilities: String, types: String) {
        self.name = name
        self.picture = picture
        self.height = height
        self.weight = weight
        self.abilities = abilities
        self.types = types
    }
}
