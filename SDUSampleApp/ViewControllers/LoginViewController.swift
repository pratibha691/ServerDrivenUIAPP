//
//  ViewController.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
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
                    let tempView = self?.genrateUIView(padding: dataValue.properties?.padding, size: dataValue.properties?.size, viewG: someView) ?? UIView()
                    if let button = someView as? CustomButton {
                        self?.handleButtonAction(button)
                    }
                    if let textField = someView as? CustomTextField {
                        textField.delegate = self
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
            case .loginButton:
                debugPrint("Handle login button action")
            default:
                debugPrint("Action not handled")
                
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //handle
        return true
    }
}
