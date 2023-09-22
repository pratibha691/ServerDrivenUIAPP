//
//  ComponentBuilderFactory.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 21/09/23.
//

import Foundation
import UIKit

class UIComponentBuilderFactory {
    static func build(element: Field) -> UIView {
        switch element.type {
        case .scrollView:
            let scrollViewBuilder = ScrollViewBuilder()
            return scrollViewBuilder.build(element: element)
            
        case .label:
            let labelBuilder = LabelBuilder()
            return labelBuilder.build(element: element)
            
        case .textField:
            let textFieldBuilder = TextFieldBuilder()
            return textFieldBuilder.build(element: element)
            
        case .button:
            let buttonBuilder = ButtonBuilder()
            return buttonBuilder.build(element: element)
            
        case .none:
            // Handle the "none" case appropriately or return a default view
            return UIView()
        }
    }
}
