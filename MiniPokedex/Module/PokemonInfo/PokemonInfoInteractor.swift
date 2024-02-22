//
//  PokemonInfoInteractor.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation

final class PokemonInfoInteractor {
    
    // MARK: - PokemonInfoInteractorInputProtocol
    weak var presenter: PokemonInfoInteractorOutputProtocol?

    // MARK: - Properties
    private let service: NetworkKitProtocol


    init(service: NetworkKitProtocol) {
        self.service = service
    }
}


// MARK: - PokemonInfoInteractorInputProtocol
extension PokemonInfoInteractor: PokemonInfoInteractorInputProtocol {
    func getPokemonInfo(url: String) {
        service.dataTask(for: PokemonInfoResponse.self, route: PokemonInfoRoute.path(url)){ [weak self] result, error in
            if let pokemonInfo = result {
                DispatchQueue.main.async {
                    self?.presenter?.didGetPokemonInfo(pokemonInfo: pokemonInfo)
                }
            } else {
                DispatchQueue.main.async {
                    self?.presenter?.onGetPokemonInfoFailure()
                }
            }
        }
    }
}
