//
//  PokemonListPresenter.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation

final class PokemonListPresenter {
    
    //MARK: - PokemonListPresenterProtocol
    var interactor: PokemonListInteractorInputProtocol?
    var pokemonList: [PokemonListViewModel] = []
    var pokemonTempList: [PokemonListViewModel] = []

    
    //MARK: - Properties
    weak private var view: PokemonListViewProtocol?
    private let router: PokemonListRouterProtocol

    
    //MARK: - Lifecycle
    init(interface: PokemonListViewProtocol, interactor: PokemonListInteractorInputProtocol?, router: PokemonListRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}


//MARK: - PokemonListPresenterProtocol
extension PokemonListPresenter: PokemonListPresenterProtocol {
    func viewDidLoad() {
        view?.showLoader()
        interactor?.fetchPokemonList()
    }

    func didSelectPokemon(at indexPath: IndexPath) {
        if let pokemonList = pokemonList.element(at: indexPath.row) {
            //Navigate to info screen
        }
    }

    func makeViewModel(using indexPath: IndexPath) -> PokemonListViewModel? {
        if let pokemon = pokemonList.element(at: indexPath.row) {
            return PokemonListViewModel(
                name: pokemon.name, url: pokemon.url)
        }
        return nil
    }
}

//MARK: - PokemonListInteractorOutputProtocol
extension PokemonListPresenter: PokemonListInteractorOutputProtocol {
    func didFetchPokemonList(pokemons: [PokemonListModel]) {
        view?.hideLoader()

        pokemons.forEach { pokemon in
            pokemonList.append(
                PokemonListViewModel(
                    name: pokemon.name?.capitalizingFirstLetter() ?? "",
                    url: pokemon.url ?? ""
                )
            )
        }
        pokemonTempList = pokemonList
        
        view?.decorate()
    }

    func onPokemonListFetchFailure() {
        view?.hideLoader()
    }
}
