//
//  PokemonListInteractor.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation

final class PokemonListInteractor {
    
    // MARK: - PokemonListInteractorInputProtocol
    weak var presenter: PokemonListInteractorOutputProtocol?

    private let service: NetworkKitProtocol

    // MARK: - Properties
    init(service: NetworkKitProtocol) {
        self.service = service
    }
}

// MARK: - PokemonListInteractorInputProtocol
extension PokemonListInteractor: PokemonListInteractorInputProtocol {
    func fetchPokemonList() {
        service.dataTask(for: PokemonListResponse.self, route: PokemonListRoute.path){ [weak self] result, error in
            if let pokemons = result?.results {
                DispatchQueue.main.async {
                    self?.presenter?.didFetchPokemonList(pokemons: pokemons)
                }
            } else {
                DispatchQueue.main.async {
                    self?.presenter?.onPokemonListFetchFailure()
                }
            }
        }
    }
}
