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

    // imageView. é para set de propriedades da imageView, imageView.layer é para set de atributos
    private lazy var backgroundImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "recipebg")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()

    private lazy var ingredientsSectionLabel = CustomLabel()

    private lazy var ingredientsContentLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    private lazy var instructionsSectionLabel = CustomLabel()

    private lazy var instructionsContentLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        setupIngredients()
        setupInstructions()
        setupScroll()
        setupUi()
        setupLabels()
    }

    func setupNavigation() {
        navigationItem.title = recipe?.name
    }

    func setupInstructions() {
        guard let instructions = recipe?.instructions else { return }
        let quote = instructions.joined(separator: ". ")
        instructionsContentLabel.text = "\(quote)."
    }

    func setupIngredients() {
        let bullet = "•  "
        guard let ingredients = recipe?.ingredients else { return }
        let list = ingredients.map { return bullet + $0 }
        let quote = list.joined(separator: "\n\n")

        ingredientsContentLabel.text = quote

//        let attributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.preferredFont(forTextStyle: .body),
//            .foregroundColor: UIColor.systemYellow
//        ]
//
//        ingredientsContentLabel.attributedText = NSAttributedString(string: quote, attributes: attributes)
    }

    func setupLabels() {
        ingredientsSectionLabel.setupSection(text: "Ingredients")
        instructionsSectionLabel.setupDefault(text: "Instructions", color: .systemGreen)
    }

    func setupScroll() {
        scrollView.addSubview(backgroundImageView)
        scrollView.addSubview(ingredientsSectionLabel)
        scrollView.addSubview(ingredientsContentLabel)
        scrollView.addSubview(instructionsSectionLabel)
        scrollView.addSubview(instructionsContentLabel)

        scrollView.subviews.forEach {(
            $0.translatesAutoresizingMaskIntoConstraints = false
        )}
        // se usar width na scroll view, todos os elementos tem que ter.
        // ao usar width, todos os elementos precisam de um centerXAnchor definido
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 240),
            backgroundImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            ingredientsSectionLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 16),
            ingredientsSectionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            ingredientsContentLabel.topAnchor.constraint(equalTo: ingredientsSectionLabel.bottomAnchor, constant: 8),
            ingredientsContentLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            ingredientsContentLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            instructionsSectionLabel.topAnchor.constraint(equalTo: ingredientsContentLabel.bottomAnchor, constant: 8),
            instructionsSectionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            instructionsContentLabel.topAnchor.constraint(equalTo: instructionsSectionLabel.bottomAnchor, constant: 8),
            instructionsContentLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            instructionsContentLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            instructionsContentLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
    }

    func setupUi() {
        view.addSubview(scrollView)

        view.subviews.forEach {(
            $0.translatesAutoresizingMaskIntoConstraints = false
        )}

        // scrollView sempre pinada na view, pelo menos o top, se não a navigation para de funcionar
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0)
        ])
    }
}
