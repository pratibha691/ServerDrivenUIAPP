//
//  UIViewControllerExtension.swift
//
//  Created by Pratibha Gupta on 20/09/23.
//

import Foundation
import UIKit

extension UIView {
    func constrainEdgesToSuperview(withInsets insets: UIEdgeInsets = .zero) {
        guard let superview = superview else {
            fatalError("View has no superview. Make sure to add it to a superview before adding constraints.")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom)
        ])
    }
    func genrateUIView(padding: Padding?, size: Size?) -> UIView {
        let tempView = UIView()
        tempView.clipsToBounds = true
        tempView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: tempView.leadingAnchor, constant: CGFloat(padding?.left ?? 16)).isActive = true
        self.trailingAnchor.constraint(equalTo: tempView.trailingAnchor, constant: -CGFloat(padding?.right ?? 16)).isActive = true
        self.bottomAnchor.constraint(equalTo: tempView.bottomAnchor, constant: -CGFloat(padding?.bottom ?? 16)).isActive = true
        self.topAnchor.constraint(equalTo: tempView.topAnchor, constant: CGFloat(padding?.top ?? 16)).isActive = true
        if let height = size?.height {
            self.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        }
        return tempView
    }

}
