//
//  CustomButton.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 18/09/23.
//

import Foundation
import UIKit

protocol ButtonConfigurable {
    var identifier: String { get }
    var backgroundColor: String { get }
    var titleColor: String { get }
    var titleFont: UIFont { get }
    var cornorRadius: CGFloat { get }
    var title: String { get }
    // Add more as requirements
}

class CustomButton: UIButton {
    // MARK: - Properties
    private var buttonAction: (() -> Void)?
    var identifier: String
    
    // MARK: - Initializers
    // MARK: - Initializers
    init(attributes: ButtonConfigurable) {
        self.identifier = attributes.identifier
        super.init(frame: .zero)
        self.setupUI(attributes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.identifier = ""
        super.init(coder: aDecoder)
    }
    
    //MARK: - UpdateUI
    private func setupUI(_ attributes:ButtonConfigurable) {
        self.backgroundColor = UIColor(hex: attributes.backgroundColor)
        self.setTitleColor(UIColor(hex: attributes.titleColor), for: .normal)
        self.titleLabel?.font = attributes.titleFont
        self.layer.cornerRadius = attributes.cornorRadius
        setTitle(attributes.title, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    
    @objc private func buttonTapped() {
        buttonAction?()
    }
    
    // MARK: - Public Method to Set Action
    func setButtonAction(_ action: @escaping () -> Void) {
        buttonAction = action
    }
}

struct ButtonConfigration: ButtonConfigurable {
    var identifier: String
    var backgroundColor: String
    var titleColor: String
    var titleFont: UIFont
    var cornorRadius: CGFloat
    var title: String
    var action: String // Add action property
    
}
