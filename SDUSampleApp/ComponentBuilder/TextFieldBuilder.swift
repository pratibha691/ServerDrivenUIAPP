//
//  TextFieldBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 19/09/23.
//

import Foundation
import UIKit

struct TextFieldBuilder: UIComponentBuilder {
    
    func build(element: ScreenElement) -> CustomTextField {
        let fontSize = CGFloat(element.style.fontSize ?? 16)
        let configuration = TextFieldConfigration(id: element.id,
            backgroundColor: UIColor(hex: element.style.backgroundColor),
            textColor: .black,
            font: UIFont.systemFont(ofSize: fontSize),
            placeholder: element.placeholder
        )
        return CustomTextField(attributes: configuration)
    }
}

