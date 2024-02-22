//
//  PokemonInfoModule.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation
import UIKit

final class PokemonInfoModule {
    public static func build(pokemon: PokemonViewModel) -> UIViewController {
        let view = PokemonInfoViewController()
        let router = PokemonInfoRouter()
        let interactor = PokemonInfoInteractor(service: NetworkKit())
        let presenter = PokemonInfoPresenter(
            interface: view,
            interactor: interactor,
            router: router,
            pokemon: pokemon
        )

        view.presenter = presenter
        router.viewController = view
        interactor.presenter = presenter

        return view
    }
}
