//
//  TextFieldBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 19/09/23.
//

import Foundation
import UIKit


protocol TextFieldActionDelegate: AnyObject {
    func handleTextFieldAction(_ identifier: String, value:String)
}

struct TextFieldBuilder: UIComponentBuilder {
    weak var textFieldActionDelegate: TextFieldActionDelegate?

    init(delegate: TextFieldActionDelegate?) {
        self.textFieldActionDelegate = delegate
    }
    
    func build(element: ScreenElement) -> CustomTextField {
        let fontSize = CGFloat(element.style.fontSize ?? 16)
        let configuration = TextFieldConfigration(id: element.id,
            backgroundColor: UIColor(hex: element.style.backgroundColor),
            textColor: UIColor(hex: element.style.color),
            font: UIFont.systemFont(ofSize: fontSize),
            placeholder: element.placeholder
        )
        let customTextField = CustomTextField(attributes: configuration)
        customTextField.setTextFieldAction { stringValue in
            self.textFieldActionDelegate?.handleTextFieldAction(element.identifier ?? "", value: stringValue)
        }
        return customTextField
    }
}

