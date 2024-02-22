//
//  PokemonInfoProtocols.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation
// MARK: - View
/// Presenter -> ViewController
protocol PokemonInfoViewProtocol: ViewProtocol {
    var presenter: PokemonInfoPresenterProtocol? { get set }
}

// MARK: - Interactor
/// Presenter -> Interactor
protocol PokemonInfoInteractorInputProtocol: AnyObject {
    var presenter: PokemonInfoInteractorOutputProtocol? { get set }
    
    func getPokemonInfo(url: String)
}

/// Interactor -> Presenter
protocol PokemonInfoInteractorOutputProtocol: AnyObject {
    func didGetPokemonInfo(pokemonInfo: PokemonInfoResponse)
    func onGetPokemonInfoFailure()
}

// MARK: - Presenter
/// ViewController -> Presenter
protocol PokemonInfoPresenterProtocol: AnyObject, ViewControllerLifeCycle {
    var interactor: PokemonInfoInteractorInputProtocol? { get set }
    func makeViewModel() -> PokemonInfoViewModel?
}


// MARK: - Router
/// Navigation
protocol PokemonInfoRouterProtocol: AnyObject {
    
}
