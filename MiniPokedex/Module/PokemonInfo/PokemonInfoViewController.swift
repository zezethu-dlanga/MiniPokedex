//
//  PokemonInfoViewController.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import UIKit

final class PokemonInfoViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    
    // MARK: - PokemonInfoViewProtocol
    var presenter: PokemonInfoPresenterProtocol?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


// MARK: - PokemonListViewProtocol
extension PokemonInfoViewController: PokemonInfoViewProtocol {
    func decorate() {
        if let viewModel = presenter?.makeViewModel() {
            pokemonImageView.image = UIImage(url: URL(string: viewModel.picture))
        }
    }

    func showLoader() {
        showBusyView()
    }

    func hideLoader() {
        hideBusyView()
    }

    func dismissView() {
        dismiss(animated: true)
    }
}

