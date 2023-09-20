//
//  ButtonBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 19/09/23.
//

import Foundation
import UIKit

enum ButtonAction: String {
    case login
    case forgotPassword
}
protocol ButtonActionDelegate: AnyObject {
    func handleButtonAction(_ action: ButtonAction)
}
struct ButtonBuilder: UIComponentBuilder {
    weak var buttonActionDelegate: ButtonActionDelegate?
    
    init(delegate: ButtonActionDelegate?) {
        self.buttonActionDelegate = delegate
    }
    func build(element: ScreenElement) -> CustomButton {
        let fontSize = CGFloat(element.style.fontSize ?? 16)
        let configuration = ButtonConfigration(id: element.id,
                                               backgroundColor: .blue,
                                               titleColor: UIColor(hex: element.style.color),
                                               titleFont: UIFont.systemFont(ofSize: fontSize),
                                               cornorRadius: 12,
                                               title: element.text ?? "",
                                               action: element.action ?? ""
        )
        let customButton = CustomButton(attributes: configuration)
        customButton.setButtonAction {
            if let action = element.action {
                self.buttonActionDelegate?.handleButtonAction(ButtonAction(rawValue: action) ?? .login)
            } else {
                debugPrint("Action not provided")
            }
        }
        return customButton
    }
}

