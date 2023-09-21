//
//  UIViewControllerExtension.swift
//
//  Created by Pratibha Gupta on 20/09/23.
//

import Foundation
import UIKit

extension UIViewController {
    enum StoryboardName: String {
        case main = "Main"
        // Add more storyboard names here as needed
    }
    /// Instantiates a view controller of the specified type from a storyboard.
    /// - Parameters:
    ///   - named: The name of the storyboard where the view controller is located. Default is `.main`.
    ///   - identifier: The optional identifier of the view controller in the storyboard. If not provided, the identifier is inferred from the view controller's type.
    /// - Returns: An instance of the specified view controller type.
    static func instantiateFromStoryboard<T: UIViewController>(named storyboardName: StoryboardName = .main, identifier: String? = nil) -> T {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let viewControllerIdentifier = identifier ?? String(describing: T.self)
        if let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? T {
            return viewController
        } else {
            fatalError("Failed to instantiate view controller from storyboard.")
        }
    }
    func genrateUIView(padding: Padding?, size: Size?, viewG: UIView) -> UIView {
        let tempView = UIView(frame: .zero)
        tempView.clipsToBounds = true
        tempView.addSubview(viewG)
        viewG.translatesAutoresizingMaskIntoConstraints = false
        viewG.leadingAnchor.constraint(equalTo: tempView.leadingAnchor, constant: CGFloat(padding?.left ?? 16)).isActive = true
        viewG.trailingAnchor.constraint(equalTo: tempView.trailingAnchor, constant: -CGFloat(padding?.right ?? 16)).isActive = true
        viewG.bottomAnchor.constraint(equalTo: tempView.bottomAnchor, constant: -CGFloat(padding?.bottom ?? 16)).isActive = true
        viewG.topAnchor.constraint(equalTo: tempView.topAnchor, constant: CGFloat(padding?.top ?? 16)).isActive = true
        viewG.heightAnchor.constraint(equalToConstant: CGFloat(size?.height ?? 0)).isActive = true
        return tempView
    }

}
