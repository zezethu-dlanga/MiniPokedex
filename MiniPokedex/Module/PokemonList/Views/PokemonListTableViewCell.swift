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
    func decorate(using viewModel: PokemonViewModel) {
        let pictureNumber:Int = viewModel.url.allNumbers.last ?? 0
        pokemonImage.image = UIImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pictureNumber).png"))
        pokemonName.text = viewModel.name
    }
}
