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
    var action: String { get } // Add action property
    // Add more as requirements
}

class CustomButton: UIButton {
    // MARK: - Properties
    private var buttonAction: (() -> Void)?
    
    
    // MARK: - Initializers
    init(attributes: ButtonConfigurable) {
        super.init(frame: .zero)
        self.setupUI(attributes)
        self.configureAction(attributes.action)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - UpdateUI
    private func setupUI(_ attributes:ButtonConfigurable) {
        self.backgroundColor = UIColor(hex: attributes.backgroundColor)
        self.setTitleColor(UIColor(hex: attributes.backgroundColor), for: .normal)
        self.titleLabel?.font = attributes.titleFont
        self.layer.cornerRadius = attributes.cornorRadius
        setTitle(attributes.title, for: .normal)
        
    }
    // MARK: - Button Action Configuration
    private func configureAction(_ action: String) {
        if !action.isEmpty {
            addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
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
