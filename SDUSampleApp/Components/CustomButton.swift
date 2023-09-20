//
//  CustomButton.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 18/09/23.
//

import Foundation
import UIKit

protocol ButtonConfigurable {
    var id: Int { get }
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
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
        tag = attributes.id
        self.backgroundColor = attributes.backgroundColor
        self.setTitleColor(attributes.titleColor, for: .normal)
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
    var id: Int
    var backgroundColor: UIColor
    var titleColor: UIColor
    var titleFont: UIFont
    var cornorRadius: CGFloat
    var title: String
    var action: String // Add action property

}
