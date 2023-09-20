//
//  ScreenBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 19/09/23.
//

import Foundation
import UIKit

protocol UIComponentBuilder {
    associatedtype ComponentType
    func build(element: ScreenElement) -> ComponentType
}

class ScreenBuilder {
    private let elements: [ScreenElement]
    weak var buttonActionDelegate: ButtonActionDelegate?
    weak var textFieldactionDelegate: TextFieldActionDelegate?

    init(elements: [ScreenElement], buttonDelegate: ButtonActionDelegate?, textFieldDelegate: TextFieldActionDelegate?) {
        self.elements = elements
        self.buttonActionDelegate = buttonDelegate
        self.textFieldactionDelegate = textFieldDelegate
    }
    
    func buildUIComponents() -> [UIView] {
            var components: [UIView] = []
            
            for element in self.elements {
                switch element.type {
                case .label:
                    let labelBuilder = LabelBuilder()
                    components.append(labelBuilder.build(element: element))
                    
                case .textInput:
                    let textFieldBuilder = TextFieldBuilder(delegate: textFieldactionDelegate)
                    components.append(textFieldBuilder.build(element: element))
                    
                case .button:
                    let buttonBuilder = ButtonBuilder(delegate: buttonActionDelegate)
                    components.append(buttonBuilder.build(element: element))
                    
                case .none:
                    debugPrint("Test")
                }
            }
            
            return components
        }
}
