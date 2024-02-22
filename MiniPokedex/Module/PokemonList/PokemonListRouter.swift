//
//  PokemonListRouter.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation
import UIKit

final class PokemonListRouter {
    weak var viewController: UIViewController?
}

// MARK: - PokemonListRouterProtocol
extension PokemonListRouter: PokemonListRouterProtocol {
    func navigateToPokemonInfo(pokemon: PokemonViewModel) {
        
        let pokemonInfoModule = PokemonInfoModule.build(pokemon: pokemon)
        viewController?.navigationController?.pushViewController(pokemonInfoModule, animated: true)
    }
}
