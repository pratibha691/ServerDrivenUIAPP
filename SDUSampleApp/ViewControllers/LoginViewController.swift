//
//  ViewController.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIStackView!
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = LoginViewModel(service: LocalService())
        viewModel.load { [weak self] success in
            if let dataV = self?.viewModel.components.first {
                for someView in dataV.view {
                    let tempView = UIView(frame: .zero)
                    tempView.addSubview(someView)
                    let dataToShow = dataV.viewData.first(where: {$0.id == someView.tag})
                    someView.translatesAutoresizingMaskIntoConstraints = false
                    someView.leadingAnchor.constraint(equalTo: tempView.leadingAnchor, constant: CGFloat(dataToShow?.padding?.paddingLeft ?? 16)).isActive = true
                    someView.trailingAnchor.constraint(equalTo: tempView.trailingAnchor, constant: CGFloat(dataToShow?.padding?.paddingRight ?? 16)).isActive = true
                    someView.bottomAnchor.constraint(equalTo: tempView.bottomAnchor, constant: CGFloat(dataToShow?.padding?.bottom ?? 16)).isActive = true
                    someView.topAnchor.constraint(equalTo: tempView.topAnchor, constant: CGFloat(dataToShow?.padding?.top ?? 16)).isActive = true

                    self?.contentView.addArrangedSubview(tempView)

                }
            }
//            for element in self?.viewModel.components ?? [] {
//                let someView = self?.viewModel.components?.view[index]
//                let dataV = self?.viewModel.components?.viewData[index]
//
//                let tempView = UIView(frame: .zero)
//                tempView.addSubview(someView!)
//                someView.translatesAutoresizingMaskIntoConstraints = false
//                someView.leadingAnchor.constraint(equalTo: tempView.leadingAnchor, constant: 100).isActive = true
//                someView.trailingAnchor.constraint(equalTo: tempView.trailingAnchor, constant: 100).isActive = true
//                someView.bottomAnchor.constraint(equalTo: tempView.bottomAnchor, constant: 100).isActive = true
//                someView.topAnchor.constraint(equalTo: tempView.topAnchor, constant: 100).isActive = true
//
//
//                self?.contentView.addArrangedSubview(tempView)
//            }
        }
       
        /*
        
*/
    }


}

