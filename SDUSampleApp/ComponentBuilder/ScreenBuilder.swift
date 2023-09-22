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
    func build(element: Field) -> ComponentType
}

class ScreenBuilder {
    private let elements: [Field]

    init(elements: [Field]) {
        self.elements = elements
    }
    
    func buildUIComponents() -> [UIView] {
        var components: [UIView] = []
        
        for element in self.elements {
            let uiComponent = UIComponentBuilderFactory.build(element: element)
            components.append(uiComponent)
        }
        
        return components
    }
}
