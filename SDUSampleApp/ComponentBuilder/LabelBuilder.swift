//
//  LabelBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 19/09/23.
//

import Foundation
import UIKit

struct LabelBuilder: UIComponentBuilder {
    func build(element: ScreenElement) -> CustomLabel {
        let fontSize = CGFloat(element.style.fontSize ?? 16)
        let configuration = LabelConfigration(id: element.id,
            text: element.text,
            textColor: .black,
            font: UIFont.systemFont(ofSize: fontSize)
        )
        return CustomLabel(attributes: configuration)
    }
}
