//
//  CustomTextField.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 18/09/23.
//

import Foundation
import UIKit

protocol TextFieldConfigurable {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
    // Add more as requirements
}

class CustomTextField: UITextField {
    // MARK: - Initializers
    init(attributes: TextFieldConfigurable) {
        super.init(frame: .zero)
        self.setupUI(attributes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - UpdateUI
    private func setupUI(_ attributes:TextFieldConfigurable) {
        self.backgroundColor = attributes.backgroundColor
        self.textColor = attributes.textColor
        self.font = attributes.font
    }
}

struct TextFieldConfigration: TextFieldConfigurable {
    var backgroundColor: UIColor
    var textColor: UIColor
    var font: UIFont
}
