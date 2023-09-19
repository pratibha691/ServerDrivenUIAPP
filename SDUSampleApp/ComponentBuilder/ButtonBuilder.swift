//
//  ButtonBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 19/09/23.
//

import Foundation
import UIKit

struct ButtonBuilder: UIComponentBuilder {
    func build(element: ScreenElement) -> CustomButton {
        let fontSize = CGFloat(element.style.fontSize ?? 16)
        let configuration = ButtonConfigration(
            backgroundColor: .blue,
            titleColor: .white,
            titleFont: UIFont.systemFont(ofSize: fontSize),
            cornorRadius: 12,
            title: element.text ?? ""
        )
        return CustomButton(attributes: configuration)
    }
}

