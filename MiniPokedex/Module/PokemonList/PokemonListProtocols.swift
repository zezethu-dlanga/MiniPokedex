//
//  PokemonListProtocols.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation

// MARK: - View
/// Presenter -> ViewController
protocol PokemonListViewProtocol: ViewProtocol {
    var presenter: PokemonListPresenterProtocol? { get set }
}

// MARK: - Interactor
/// Presenter -> Interactor
protocol PokemonListInteractorInputProtocol: AnyObject {
    var presenter: PokemonListInteractorOutputProtocol? { get set }
    func fetchPokemonList()
}

/// Interactor -> Presenter
protocol PokemonListInteractorOutputProtocol: AnyObject {
    func didFetchPokemonList(pokemons: [PokemonListModel])
    func onPokemonListFetchFailure()
}

// MARK: - Presenter
/// ViewController -> Presenter
protocol PokemonListPresenterProtocol: AnyObject, ViewControllerLifeCycle {
    var interactor: PokemonListInteractorInputProtocol? { get set }
    var pokemonList: [PokemonViewModel] { get set}
    var pokemonTempList: [PokemonViewModel] { get set}

    func didSelectPokemon(at indexPath: IndexPath)
    func makeViewModel(using indexPath: IndexPath) -> PokemonViewModel?
}

// MARK: - Router
/// Navigation
protocol PokemonListRouterProtocol: AnyObject {
    func navigateToPokemonInfo(pokemon: PokemonViewModel)
}
