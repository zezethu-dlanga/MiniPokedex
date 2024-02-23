//
//  PokemonInfoViewController.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import UIKit

final class PokemonInfoViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var contentView: UIStackView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    
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
            contentView.isHidden = false
            pokemonImageView.image = UIImage(url: URL(string: viewModel.picture))
            pokemonName.text = viewModel.name
            heightLabel.text = viewModel.height
            weightLabel.text = viewModel.weight
            abilitiesLabel.text = viewModel.abilities
            typesLabel.text = viewModel.types
        } else {
            contentView.isHidden = true
            //Display error handling message or dialog
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

