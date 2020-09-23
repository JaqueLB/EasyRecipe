//
//  RecipesViewModel.swift
//  EasyRecipe
//
//  Created by Jaque on 10/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class RecipesViewModel: NSObject {
    // MARK: variables
    private var recipes = [Recipe]()

    // MARK: closures
    var didTapRecipe: ((RecipeDetailsViewController) -> Void)?

    // MARK: methods
    func populate(with recipe: Recipe) {
        recipes.append(recipe)
    }

    func numberOfRows() -> Int {
        return recipes.count
    }

    func cellForRowAt(indexPath: IndexPath) -> Recipe {
        return recipes[indexPath.row]
    }

    func didSelectRowAt(indexPath: IndexPath) {
        let recipe = cellForRowAt(indexPath: indexPath)
        let details = RecipeDetailsViewController()
        details.recipe = recipe
        didTapRecipe?(details)
    }
}
