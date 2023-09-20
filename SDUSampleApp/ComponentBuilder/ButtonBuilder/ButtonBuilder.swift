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
    func build(element: Field) -> CustomButton {
        let fontSize = CGFloat(16)
        let configuration = ButtonConfigration(identifier: element.identifier ?? "",
                                               backgroundColor: element.properties?.backgroundColor ?? "000000",
                                               titleColor: element.properties?.color ?? "000000",
                                               titleFont: UIFont.systemFont(ofSize: fontSize),
                                               cornorRadius: 12,
                                               title: element.properties?.title ?? "",
                                               action: element.properties?.action?.type ?? ""
        )
        let customButton = CustomButton(attributes: configuration)
        customButton.setButtonAction {
            if let action = element.properties?.action?.type {
                self.buttonActionDelegate?.handleButtonAction(ButtonAction(rawValue: action) ?? .login)
            } else {
                debugPrint("Action not provided")
            }
        }
        return customButton
    }
}

