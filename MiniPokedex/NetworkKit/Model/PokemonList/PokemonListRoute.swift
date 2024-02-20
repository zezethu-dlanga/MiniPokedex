//
//  PokemonListRoute.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation

enum PokemonListRoute {
    case path
}

extension PokemonListRoute: RouteProviding {
    var path: String {
        "https://pokeapi.co/api/v2/pokemon?limit=100&offset=0"
    }

    var url: URL {
        URL(string: path)!
    }

    var httpMethod: String {
        "GET"
    }
    
    var body: Data? {
        nil
    }
}
