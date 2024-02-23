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
    let hp: String
    let hpStat: Int
    let attack: String
    let attackStat: Int
    let defence: String
    let defenceStat: Int
    let specialAttack: String
    let specialAttackStat: Int
    let specialDefence: String
    let specialDefenceStat: Int
    let speed: String
    let speedStat: Int

    init(name: String, picture: String, height: String, weight: String, abilities: String, types: String, hp: String, hpStat: Int, attack: String, attackStat: Int, defence: String, defenceStat: Int, specialAttack: String, specialAttackStat: Int, specialDefence: String, specialDefenceStat: Int, speed: String, speedStat: Int) {
        self.name = name
        self.picture = picture
        self.height = height
        self.weight = weight
        self.abilities = abilities
        self.types = types
        self.hp = hp
        self.hpStat = hpStat
        self.attack = attack
        self.attackStat = attackStat
        self.defence = defence
        self.defenceStat = defenceStat
        self.specialAttack = specialAttack
        self.specialAttackStat = specialAttackStat
        self.specialDefence = specialDefence
        self.specialDefenceStat = specialDefenceStat
        self.speed = speed
        self.speedStat = speedStat
    }
}
