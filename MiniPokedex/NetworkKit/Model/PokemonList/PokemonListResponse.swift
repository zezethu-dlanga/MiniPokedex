//
//  PokemonListResponse.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation

struct PokemonListResponse: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [PokemonListModel]?

    init(count: Int?, next: String?, previous: String?, totalPages: Int?, results: [PokemonListModel]?) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

struct PokemonListModel: Codable {
    let name: String?
    let url: String?
    
    init(name: String? = nil, url: String? = nil) {
        self.name = name
        self.url = url
    }
}
