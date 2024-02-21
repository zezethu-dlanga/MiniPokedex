//
//  PokemonListTableViewCell.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
}

extension PokemonListTableViewCell {
    func decorate(using viewModel: PokemonListViewModel) {
       // pokemonImage.image = UIImage(url: URL(string: viewModel.url))
        pokemonName.text = viewModel.name
    }
}
