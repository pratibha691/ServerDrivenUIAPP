//
//  ScreenModel.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import Foundation
import UIKit
// MARK: - ScreenModel
struct ScreenModel: Decodable {
    let screen: String?
    let title: ScreenTitle?
    let elements: [ScreenElement]?
}

// MARK: - Element
struct ScreenElement: Decodable {
    let type: ComponentType?
    let text: String?
    let style: ScreenElementStyle
    let placeholder, key: String?
    let secure: Bool?
    let action: String?
}

enum ComponentType: String, Decodable {
    case label
    case textInput
    case button
}

// MARK: - ElementStyle
struct ScreenElementStyle: Decodable {
    let color: String?
    let fontSize: Int?
    let backgroundColor: String?
}

// MARK: - Title
struct ScreenTitle: Decodable {
    let text: String?
    let style: ScreenTitleStyle
}

// MARK: - TitleStyle
struct ScreenTitleStyle: Decodable {
    let color: String?
    let fontSize: Int?
}

extension ScreenModel {
    
    func buildUIComponents() -> [UIView] {
        
        var components: [UIView] = []
        
        for element in self.elements ?? [] {
            switch element.type {
            case .label:
                let configuration = LabelConfigration(text: element.text, textColor: .black, font: UIFont.systemFont(ofSize: CGFloat(element.style.fontSize ?? 16)))
                let label = CustomLabel(attributes: configuration)
                components.append(label)
            case .textInput:
                let configuration = TextFieldConfigration(backgroundColor: .red, textColor: .black, font: UIFont.systemFont(ofSize: CGFloat(element.style.fontSize ?? 16)), placeholder: element.placeholder)
                let textField = CustomTextField(attributes: configuration)
                components.append(textField)
            case .button:
                let configuration = ButtonConfigration(backgroundColor: .black, titleColor: .white, titleFont: UIFont.systemFont(ofSize: CGFloat(element.style.fontSize ?? 16)), cornorRadius: 12)
                let button = CustomButton(attributes: configuration)
                components.append(button)
            case .none:
                debugPrint("Test")

            }
        }
        
        return components
    }
    
}
