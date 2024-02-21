//
//  PokemonListViewController.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import UIKit

class PokemonListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    
    // MARK: - PokemonListViewProtocol
    var presenter: PokemonListPresenterProtocol?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupSearchBar()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
}


// MARK: - PokemonListViewProtocol
extension PokemonListViewController: PokemonListViewProtocol {
    func decorate() {
        tableView?.reloadData()
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

private extension PokemonListViewController {
    func setupTableView() {
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }
    
    func setupSearchBar() {
        self.searchBar.delegate = self
    }

    func registerCells() {
        let nib = UINib(nibName: PokemonListTableViewCell.defaultReuseIdentifier, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: PokemonListTableViewCell.defaultReuseIdentifier)
    }
}


// MARK: - UITableViewDelegate
extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.pokemonList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListTableViewCell.defaultReuseIdentifier) as? PokemonListTableViewCell

        if let viewModel = presenter?.makeViewModel(using: indexPath) {
            cell?.decorate(using: viewModel)
        }

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectPokemon(at: indexPath)
    }
}


// MARK: - UISearchBarDelegate
extension PokemonListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.pokemonList = presenter?.pokemonTempList ?? []
        
        if searchText.count > 0 {
            presenter?.pokemonList = presenter?.pokemonTempList.filter { $0.name.localizedCaseInsensitiveContains(searchText)} ?? []
        }
        tableView?.reloadData()
    }
}
