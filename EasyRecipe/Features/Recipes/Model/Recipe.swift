//
//  User.swift
//  EasyRecipe
//
//  Created by Jaque on 10/09/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import Foundation

struct Recipe {
    var id = UUID()
    var name: String
    var ingredients: [String]
    var instructions: [String]
}
