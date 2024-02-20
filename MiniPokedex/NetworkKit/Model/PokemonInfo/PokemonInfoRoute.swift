//
//  PokemonInfoRoute.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation

enum PokemonInfoRoute {
    case path(String)
}

extension PokemonInfoRoute: RouteProviding {
    var path: String {
        switch self {
        case let .path(pokemonInfoPath) :
            return pokemonInfoPath
        }
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
