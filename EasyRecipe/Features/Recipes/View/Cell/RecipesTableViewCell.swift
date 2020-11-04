//
//  RecipesTableViewCell.swift
//  EasyRecipe
//
//  Created by Jaque on 10/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {
    private lazy var recipeNameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .systemPurple
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUi()
    }
    // for storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func populate(with recipe: Recipe) {
        recipeNameLabel.text = recipe.name
    }

    func setupUi() {
        addSubview(recipeNameLabel)

        recipeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        recipeNameLabel.autoresizesSubviews = true

        NSLayoutConstraint.activate([
            recipeNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            recipeNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

extension UITableViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
