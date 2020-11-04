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

    override init() {
        super.init()
        let recipe1 = Recipe(name: "Scrambled Eggs", ingredients: ["2 eggs", "1 tbsp olive oil", "1/2 onion", "salt and pepper"], instructions: ["Heat the olive oil on a frying pan", "Chop the half onion as cubes", "Crack the eggs on a bowl and mix with the onions", "Season with salt and pepper", "Pour the mixture in the frying pan, and mix gently with a spatula, until the yolks are hard"])
        let recipe2 = Recipe(name: "Easy Cookies", ingredients: ["1 baking mixture baunilha flavored", "Dark chocolate chips or 1 dark chocolate tablet", "1/2 cup oil", "2 eggs"], instructions: ["Mix the baking mixture with the eggs and the oil", "Cut the chocolate tablet into squared pieces and add to the mixture", "If you decided to use chocolate chips, just incorporate them in the dough", "Pre heat the oven for 10 min at 180C", "Grease the pan with oil and flour", "Using a ice cream spoon, distribute the dough on the pan", "Bake for 15 min or until golden colored"])
        let recipe3 = Recipe(name: "Mug Cake", ingredients: ["1 tbsp cocoa", "1 tbsp flour", "2 tbsp whole milk", "1 egg", "1 tsp baking soda"], instructions: ["Mix everything together", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi molestie iaculis interdum. Phasellus eu ultricies augue, non egestas metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla lacus tortor, tristique non enim a, aliquet luctus massa. Quisque ut leo luctus libero tincidunt ultrices vel at metus. Pellentesque vitae lectus turpis. Mauris a lectus convallis, interdum nisi eu, posuere tellus. Quisque scelerisque orci eget rutrum varius. Nullam interdum lacus nec lacus malesuada, ut varius justo posuere. Morbi ac turpis egestas, sodales odio a, eleifend nisl. Aenean id massa tristique, tristique dolor accumsan, semper metus. Donec tristique velit vel bibendum rhoncus. Pellentesque eget diam lectus. Morbi arcu elit, facilisis nec facilisis ut, dignissim ac enim.Sed ultrices varius ex, eget suscipit felis pharetra in. Ut consequat lacinia nisi eu ultricies. Ut ut vestibulum massa. In risus magna, venenatis at elementum eget, venenatis non tellus. Morbi pellentesque sapien in augue dignissim, quis porttitor sem laoreet. Duis sodales leo et tortor ullamcorper, vel feugiat metus varius. Aliquam lacus turpis, consequat at mattis ac, tincidunt sed elit. Nunc fringilla, nisi ac tincidunt finibus, ante ipsum lacinia nisi, a tincidunt mi metus at neque. Vestibulum non sapien elit. Praesent eu tellus quam. Sed ut tortor quam. Aenean convallis orci neque, sit amet pellentesque nisl ornare vulputate. Fusce porta rutrum tristique. Pellentesque consequat pharetra mi, eu ornare orci venenatis ut. Curabitur et rutrum sem, eget condimentum arcu. Suspendisse sed lectus porttitor, vehicula diam quis, convallis tellus. Morbi rhoncus enim nisi, sit amet venenatis diam cursus id. Nam sit amet tempus arcu, vitae pharetra tellus. Curabitur rutrum tortor eu orci ullamcorper rhoncus. Phasellus in lacus eu elit consectetur lobortis vel non nibh. Morbi id est dui. Phasellus sed congue sapien, at pharetra velit. In justo libero, interdum posuere ligula non, tempus rutrum purus"])

        self.populate(with: recipe1)
        self.populate(with: recipe2)
        self.populate(with: recipe3)
    }
}
