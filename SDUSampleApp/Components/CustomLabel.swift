//
//  CustomLabel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 18/09/23.
//

import Foundation
import UIKit

protocol LabelConfigurable {
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
        self.textColor = attributes.textColor
        self.font = attributes.font
    }
}

struct LabelConfigration: LabelConfigurable {
    var textColor: UIColor
    var font: UIFont
}
