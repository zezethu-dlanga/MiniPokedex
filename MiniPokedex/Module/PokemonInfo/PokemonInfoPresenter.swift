//
//  PokemonInfoPresenter.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation

final class PokemonInfoPresenter {
    
    // MARK: - PokemonInfoPresenterProtocol
    var interactor: PokemonInfoInteractorInputProtocol?
    var pokemon: PokemonViewModel?

    
    // MARK: - Properties
    weak private var view: PokemonInfoViewProtocol?
    private let router: PokemonInfoRouterProtocol
    private var pokemonInfoView: PokemonInfoViewModel?


    // MARK: - Lifecycle
    init(interface: PokemonInfoViewProtocol,
         interactor: PokemonInfoInteractorInputProtocol?,
         router: PokemonInfoRouterProtocol,
         pokemon: PokemonViewModel) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.pokemon = pokemon
    }
}


// MARK: - PokemonInfoPresenterProtocol
extension PokemonInfoPresenter: PokemonInfoPresenterProtocol {
    func makeViewModel() -> PokemonInfoViewModel? {
        return pokemonInfoView
    }
    
    func viewDidLoad() {
        view?.showLoader()
        interactor?.getPokemonInfo(url: pokemon?.url ?? "")
    }
}


// MARK: - PokemonInfoInteractorOutputProtocol
extension PokemonInfoPresenter: PokemonInfoInteractorOutputProtocol {
    func didGetPokemonInfo(pokemonInfo: PokemonInfoResponse) {
        view?.hideLoader()
        
        var abilities = ""
        var types = ""
        var hpStat = 0
        var attackStat = 0
        var defenceStat = 0
        var specialAttackStat = 0
        var specialDefenceStat = 0
        var speedStat = 0
        
        
        pokemonInfo.abilities?.forEach {
            abilities.append("\($0.ability?.name?.capitalizingFirstLetter() ?? "") ")
        }
        
        pokemonInfo.types?.forEach {
            types.append("\($0.type?.name?.capitalizingFirstLetter() ?? "") ")
        }

        pokemonInfo.stats?.forEach { pokemon in
            if pokemon.stat?.name == "hp" {
                hpStat = pokemon.base_stat ?? 0
            }
            else if pokemon.stat?.name == "attack" {
                attackStat = pokemon.base_stat ?? 0
            }
            else if pokemon.stat?.name == "defense" {
                defenceStat = pokemon.base_stat ?? 0
            }
            else if pokemon.stat?.name == "special-attack" {
                specialAttackStat = pokemon.base_stat ?? 0
            }
            else if pokemon.stat?.name == "special-defense" {
                specialDefenceStat = pokemon.base_stat ?? 0
            }
            else if pokemon.stat?.name == "speed" {
                speedStat = pokemon.base_stat ?? 0
            }
        }
        
        pokemonInfoView = PokemonInfoViewModel(
            name: pokemonInfo.name ?? "",
            picture: pokemonInfo.sprites?.other?.home?.front_default ?? "",
            height: "Height: \(pokemonInfo.height ?? 0)",
            weight: "Weight: \(pokemonInfo.weight ?? 0)",
            abilities: "Abilities: \(abilities)",
            types: "Types: \(types)",
            hpStat: hpStat,
            attackStat: attackStat,
            defenceStat: defenceStat,
            specialAttackStat: specialAttackStat,
            specialDefenceStat: specialDefenceStat,
            speedStat: speedStat
        )
        view?.decorate()
    }
    
    func onGetPokemonInfoFailure() {
        view?.hideLoader()
    }
}
