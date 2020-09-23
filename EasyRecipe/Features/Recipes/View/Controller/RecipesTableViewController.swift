//
//  RecipesTableViewController.swift
//  EasyRecipe
//
//  Created by Jaque on 10/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
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

        let recipe1 = Recipe(name: "Scrambled Eggs", ingredients: ["2 eggs", "1 tbsp olive oil", "1/2 onion", "salt and pepper"], instructions: ["Heat the olive oil on a frying pan", "Chop the half onion as cubes", "Crack the eggs on a bowl and mix with the onions", "Season with salt and pepper", "Pour the mixture in the frying pan, and mix gently with a spatula, until the yolks are hard"])
        let recipe2 = Recipe(name: "Easy Cookies", ingredients: ["1 baking mixture baunilha flavored", "Dark chocolate chips or 1 dark chocolate tablet", "1/2 cup oil", "2 eggs"], instructions: ["Mix the baking mixture with the eggs and the oil", "Cut the chocolate tablet into squared pieces and add to the mixture", "If you decided to use chocolate chips, just incorporate them in the dough", "Pre heat the oven for 10 min at 180C", "Grease the pan with oil and flour", "Using a ice cream spoon, distribute the dough on the pan", "Bake for 15 min or until golden colored"])

        viewModel.populate(with: recipe1)
        viewModel.populate(with: recipe2)
    }

    func setupNavigation() {
        navigationItem.title = "Recipes"
        navigationController?.navigationBar.prefersLargeTitles = true
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
