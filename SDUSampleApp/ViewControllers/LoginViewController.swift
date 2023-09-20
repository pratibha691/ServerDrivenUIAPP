//
//  ViewController.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIStackView!
    var viewModel: LoginViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        
    }
    private func loadData() {
        viewModel.load { [weak self] success in
            if let dataV = self?.viewModel.components.first {
                for index in dataV.view.indices {
                    let dataValue = dataV.viewData[index]
                    let someView = dataV.view[index]
                    let tempView = self?.genrateUIView(padding: dataValue.properties?.padding, viewG: someView) ?? UIView()
                    if let button = someView as? CustomButton {
                        self?.handleButtonAction(button)
                    }
                    tempView.backgroundColor = .white
                    self?.contentView.addArrangedSubview(tempView)
                }
                let paddingData = self?.viewModel.currentScreenData?.padding
                if let currentView = self?.view {
                    self?.contentView.translatesAutoresizingMaskIntoConstraints = false
                    self?.contentView.leadingAnchor.constraint(equalTo: currentView.leadingAnchor, constant: CGFloat(paddingData?.left ?? 16)).isActive = true
                    self?.contentView.trailingAnchor.constraint(equalTo: currentView.trailingAnchor, constant: -CGFloat(paddingData?.right ?? 16)).isActive = true
                    self?.contentView.bottomAnchor.constraint(greaterThanOrEqualTo: currentView.bottomAnchor, constant: -CGFloat(paddingData?.bottom ?? 16) ).isActive = false
                    self?.contentView.topAnchor.constraint(equalTo: currentView.topAnchor, constant: CGFloat(paddingData?.top ?? 16)).isActive = true
                }
            }
        }
    }
}

extension LoginViewController {
    func handleButtonAction(_ button: CustomButton) {
        button.setButtonAction {
            switch button.identifier {
            case .loginButton :
                debugPrint("Handle login button action")
            default:
                debugPrint("Action not handled")
                
            }
        }
    }
}
