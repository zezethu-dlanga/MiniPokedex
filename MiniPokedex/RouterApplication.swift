//
//  RouterApplication.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation
import UIKit

class RouterApplication {
    static let shared = RouterApplication()

    func startWindow(window: UIWindow?) {
        let pokemonListModule = PokemonListModule.build()
        let controller = PokemonListViewController(nibName: "PokemonListViewController", bundle: nil)
        controller.view = pokemonListModule.view
        let navigationViewContoller = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationViewContoller
       
    }
}
