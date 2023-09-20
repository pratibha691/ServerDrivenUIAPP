//
//  CustomTextField.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 18/09/23.
//

import Foundation
import UIKit

protocol TextFieldConfigurable {
    var identifier: ComponentIdentifier { get }
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
    var placeholder: String? { get }

    // Add more as requirements
}

class CustomTextField: UITextField {
    // MARK: - Properties
    private var textFieldAction: ((String) -> Void)?
    
    // MARK: - Initializers
    init(attributes: TextFieldConfigurable) {
        super.init(frame: .zero)
        self.setupUI(attributes)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - UpdateUI
    private func setupUI(_ attributes:TextFieldConfigurable) {
        self.backgroundColor = attributes.backgroundColor
        self.textColor = attributes.textColor
        self.font = attributes.font
        self.placeholder = attributes.placeholder
        borderStyle = .roundedRect
        
    }
    
    // MARK: - Public Method to Set Action
    func setTextFieldAction(_ action: @escaping (String) -> Void) {
        textFieldAction = action
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.textFieldAction?(string)
        return true
    }
}

struct TextFieldConfigration: TextFieldConfigurable {
    var identifier: ComponentIdentifier
    var backgroundColor: UIColor
    var textColor: UIColor
    var font: UIFont
    var placeholder: String?
}
