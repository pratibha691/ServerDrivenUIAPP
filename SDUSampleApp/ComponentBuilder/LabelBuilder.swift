//
//  LabelBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 19/09/23.
//

import Foundation
import UIKit

struct LabelBuilder: UIComponentBuilder {
    func build(element: Field) -> CustomLabel {
        let fontSize = CGFloat(16)
        let configuration = LabelConfigration(identifier: element.identifier,
                                              text: element.properties?.label ?? "",
                                              textColor: UIColor(hex: element.properties?.color ?? "000000"),
                                              font: UIFont.systemFont(ofSize: fontSize)
        )
        return CustomLabel(attributes: configuration)
    }
}
