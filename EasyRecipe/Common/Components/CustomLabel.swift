//
//  CustomLabel.swift
//  EasyRecipe
//
//  Created by Jaqueline Lemes Botaro on 13/11/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    
    func setupSection(text: String) {
        self.text = text
        textAlignment = .center
        textColor = .systemPurple
        font = .systemFont(ofSize: 20)
    }
    
    func setupDefault(text: String? = "Default Label", alignment: NSTextAlignment? = .center, color: UIColor? = .systemPurple, fontSize: CGFloat? = 20) {
        self.text = text
        if let alignment = alignment {
            textAlignment = alignment
        }
        textColor = color
        if let fontSize = fontSize {
            font = .systemFont(ofSize: fontSize)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
