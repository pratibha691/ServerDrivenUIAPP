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
                for someView in dataV.view {
                    let tempView = self?.genrateUIView(padding: self?.viewModel?.currentScreenData?.padding, viewG: someView) ?? UIView()
                    if let button = someView as? CustomButton {
                        self?.handleButtonAction(button)
                    }
                    tempView.backgroundColor = .white
                    self?.contentView.addArrangedSubview(tempView)
                }
            }
        }
    }
}

extension LoginViewController {
    func handleButtonAction(_ button: CustomButton) {
        button.setButtonAction {
            switch button.identifier {
            case "login_button" :
                debugPrint("Handle login button action")
            default:
                debugPrint("Action not handled")
                
            }
        }
    }
}
