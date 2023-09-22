//
//  ScrollViewBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 21/09/23.
//

import Foundation
import UIKit

class ScrollViewBuilder: UIComponentBuilder {
    func build(element: Field) -> UIView {
        // Create the main view

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the scrollView
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        // Create the contentView inside the scrollView
        let contentView = UIView()
        scrollView.addSubview(contentView)
        
        // Create the stackView inside the contentView
        let stackView = UIStackView()
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        
        // Apply constraints
        
        scrollView.contentSize = contentView.bounds.size
        
        return view
    }
}
