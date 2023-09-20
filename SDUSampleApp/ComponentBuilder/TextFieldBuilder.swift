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
    
    func build(element: Field) -> CustomTextField {
        let fontSize = CGFloat(16)
        let configuration = TextFieldConfigration(identifier: element.identifier ?? "",
            backgroundColor: UIColor(hex: element.properties?.backgroundColor ?? ""),
            textColor: UIColor(hex: element.properties?.color ?? ""),
            font: UIFont.systemFont(ofSize: fontSize),
                                                  placeholder: element.properties?.placeHolder ?? ""
        )
        let customTextField = CustomTextField(attributes: configuration)
        customTextField.setTextFieldAction { stringValue in
            self.textFieldActionDelegate?.handleTextFieldAction(element.identifier ?? "", value: stringValue)
        }
        return customTextField
    }
}

