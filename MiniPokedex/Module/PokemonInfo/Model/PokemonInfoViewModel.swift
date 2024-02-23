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
    let hpStat: Int
    let attackStat: Int
    let defenceStat: Int
    let specialAttackStat: Int
    let specialDefenceStat: Int
    let speedStat: Int

    init(name: String, picture: String, height: String, weight: String, abilities: String, types: String, hpStat: Int, attackStat: Int, defenceStat: Int, specialAttackStat: Int, specialDefenceStat: Int, speedStat: Int) {
        self.name = name
        self.picture = picture
        self.height = height
        self.weight = weight
        self.abilities = abilities
        self.types = types
        self.hpStat = hpStat
        self.attackStat = attackStat
        self.defenceStat = defenceStat
        self.specialAttackStat = specialAttackStat
        self.specialDefenceStat = specialDefenceStat
        self.speedStat = speedStat
    }
}
