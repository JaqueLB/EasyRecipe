//
//  RecipeDetailsViewController.swift
//  EasyRecipe
//
//  Created by Jaque on 10/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    var recipe: Recipe?

    private lazy var ingredientsSectionLabel: UILabel = {
        var label = UILabel()
        label.text = "Ingredients"
        label.textAlignment = .center
        label.textColor = .systemPurple
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    private lazy var ingredientsTextView: UITextView = {
        var textView = UITextView()
        textView.textColor = .black
        textView.isScrollEnabled = true
        textView.font = .italicSystemFont(ofSize: 14)
        return textView
    }()

    private lazy var instructionsSectionLabel: UILabel = {
        var label = UILabel()
        label.text = "Instructions"
        label.textAlignment = .center
        label.textColor = .systemPurple
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    private lazy var instructionsTextView: UITextView = {
        var textView = UITextView()
        textView.textColor = .black
        textView.isScrollEnabled = true
        textView.font = .systemFont(ofSize: 12)
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        setupIngredients()
        setupInstructions()
        setupUi()
    }

    func setupNavigation() {
        navigationItem.title = recipe?.name
    }

    func setupInstructions() {
        let bullet = "•  "
        guard let instructions = recipe?.instructions else { return }
        let list = instructions.map { return bullet + $0 }

        // understand this better
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.darkGray

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle

        let string = list.joined(separator: "\n\n")
        instructionsTextView.text = string
    }

    func setupIngredients() {
        let bullet = "•  "
        guard let ingredients = recipe?.ingredients else { return }
        let list = ingredients.map { return bullet + $0 }

        // understand this better
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.darkGray

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle

        let string = list.joined(separator: "\n\n")
        ingredientsTextView.text = string
    }

    func setupUi() {
        view.backgroundColor = .systemBackground

        view.addSubview(ingredientsSectionLabel)
        view.addSubview(ingredientsTextView)

        view.addSubview(instructionsSectionLabel)
        view.addSubview(instructionsTextView)

        view.subviews.forEach {(
            $0.translatesAutoresizingMaskIntoConstraints = false
        )}

        NSLayoutConstraint.activate([
            ingredientsSectionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ingredientsSectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            ingredientsTextView.topAnchor.constraint(equalTo: ingredientsSectionLabel.bottomAnchor, constant: 4),
            ingredientsTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            ingredientsTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            ingredientsTextView.heightAnchor.constraint(equalToConstant: 128),

            instructionsSectionLabel.topAnchor.constraint(equalTo: ingredientsTextView.bottomAnchor, constant: 4),
            instructionsSectionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),

            instructionsTextView.topAnchor.constraint(equalTo: instructionsSectionLabel.bottomAnchor, constant: 4),
            instructionsTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            instructionsTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            instructionsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
