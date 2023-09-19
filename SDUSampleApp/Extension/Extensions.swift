//
//  Extensions.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 18/09/23.
//

import Foundation
import UIKit

// MARK :- 
extension UIView {
    func genrateUIView(padding:Padding?, viewG:UIView) -> UIView {
        let tempView = UIView(frame: .zero)
        tempView.clipsToBounds = true
        tempView.addSubview(viewG)
        //viewG.backgroundColor = .gray
        viewG.translatesAutoresizingMaskIntoConstraints = false
        viewG.leadingAnchor.constraint(equalTo: tempView.leadingAnchor, constant: CGFloat(padding?.paddingLeft ?? 16)).isActive = true
        viewG.trailingAnchor.constraint(equalTo: tempView.trailingAnchor, constant: -CGFloat(padding?.paddingRight ?? 16)).isActive = true
        viewG.bottomAnchor.constraint(equalTo: tempView.bottomAnchor, constant: -CGFloat(padding?.bottom ?? 16)).isActive = true
        viewG.topAnchor.constraint(equalTo: tempView.topAnchor, constant: CGFloat(padding?.top ?? 16)).isActive = true
        
        return tempView
    }
}
