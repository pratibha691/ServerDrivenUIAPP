//
//  CustomButton.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 18/09/23.
//

import Foundation
import UIKit

protocol ButtonConfigurable {
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
    var titleFont: UIFont { get }
    var cornorRadius: CGFloat { get }
    // Add more as requirements
}

class CustomButton: UIButton {
    // MARK: - Initializers
    init(attributes: ButtonConfigurable) {
        super.init(frame: .zero)
        self.setupUI(attributes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - UpdateUI
    private func setupUI(_ attributes:ButtonConfigurable) {
        self.backgroundColor = attributes.backgroundColor
        self.setTitleColor(attributes.titleColor, for: .normal)
        self.titleLabel?.font = attributes.titleFont
        self.layer.cornerRadius = attributes.cornorRadius
    }
}

struct ButtonConfigration: ButtonConfigurable {
    var backgroundColor: UIColor
    var titleColor: UIColor
    var titleFont: UIFont
    var cornorRadius: CGFloat
}
