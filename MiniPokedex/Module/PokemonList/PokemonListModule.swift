//
//  PokemonListModule.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation
import UIKit

final class PokemonListModule {
    static func build() -> UIViewController {
        let view = PokemonListViewController()
        let router = PokemonListRouter()
        let interactor = PokemonListInteractor(service: NetworkKit())
        let presenter = PokemonListPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        router.viewController = view
        interactor.presenter = presenter

        return view
    }
}
