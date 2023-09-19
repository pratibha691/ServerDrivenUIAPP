//
//  CustomLabel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 18/09/23.
//

import Foundation
import UIKit

protocol LabelConfigurable {
    var id: Int { get }
    var text: String? { get }
    var textColor:UIColor { get }
    var font: UIFont { get }
    // Add more as requirements
}

class CustomLabel: UILabel {
    
    // MARK: - Initializers
    
    init(attributes: LabelConfigurable) {
        super.init(frame: .zero)
        self.setupUI(attributes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - UpdateUI
    private func setupUI(_ attributes:LabelConfigurable) {
        self.tag = attributes.id
        self.textColor = attributes.textColor
        self.font = attributes.font
        self.text = attributes.text
    }
}

struct LabelConfigration: LabelConfigurable {
    var id: Int
    var text: String?
    var textColor: UIColor
    var font: UIFont
}

