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
    @IBOutlet weak var hpStat: UILabel!
    @IBOutlet weak var speedStat: UILabel!
    @IBOutlet weak var specialAttackStat: UILabel!
    @IBOutlet weak var defenseStat: UILabel!
    @IBOutlet weak var attackStat: UILabel!
    @IBOutlet weak var specialDefenseStat: UILabel!
    @IBOutlet weak var hpProgress: GradientProgressView!
    @IBOutlet weak var attackProgress: GradientProgressView!
    @IBOutlet weak var defenseProgress: GradientProgressView!
    @IBOutlet weak var specialAttackProgress: GradientProgressView!
    @IBOutlet weak var specialDefenseProgress: GradientProgressView!
    @IBOutlet weak var speedProgress: GradientProgressView!
    
    
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
            
            hpStat.text = "\(viewModel.hpStat)"
            attackStat.text = "\(viewModel.attackStat)"
            defenseStat.text = "\(viewModel.defenceStat)"
            specialAttackStat.text = "\(viewModel.specialAttackStat)"
            specialDefenseStat.text = "\(viewModel.specialDefenceStat)"
            speedStat.text = "\(viewModel.speedStat)"
            
            hpProgress.setProgress(Float(CGFloat(viewModel.hpStat) / 100), animated: true)
            attackProgress.setProgress(Float(CGFloat(viewModel.attackStat) / 100), animated: true)
            defenseProgress.setProgress(Float(CGFloat(viewModel.defenceStat) / 100), animated: true)
            specialAttackProgress.setProgress(Float(CGFloat(viewModel.specialAttackStat) / 100), animated: true)
            specialDefenseProgress.setProgress(Float(CGFloat(viewModel.specialDefenceStat) / 100), animated: true)
            speedProgress.setProgress(Float(CGFloat(viewModel.speedStat) / 100), animated: true)
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

