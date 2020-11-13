//
//  RecipesTableViewController.swift
//  EasyRecipe
//
//  Created by Jaque on 10/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    // TODO: put sections for types of recipes
    private var viewModel = RecipesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewModel()
        setupNavigation()
        setupTableView()
    }
}

// MARK: methods
extension RecipesTableViewController {
    func setupViewModel() {
        viewModel.didTapRecipe = { recipeDetailController in
            self.navigationController?.pushViewController(recipeDetailController, animated: true)
        }
    }

    func setupNavigation() {
        navigationItem.title = "Recipes"
    }

    func setupTableView() {
        tableView.register(RecipesTableViewCell.self, forCellReuseIdentifier: RecipesTableViewCell.reuseIdentifier)
    }
}

// MARK: Setup TableView Delegates
extension RecipesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipesTableViewCell.reuseIdentifier, for: indexPath) as! RecipesTableViewCell
        let recipe = viewModel.cellForRowAt(indexPath: indexPath)
        cell.populate(with: recipe)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(indexPath: indexPath)
    }
}
