//
//  ViewController.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModelProtocol!
    typealias ButtonAction = () -> Void
    let buttonActions: [ComponentIdentifier: ButtonAction] = [.loginButton: { print("login button tapped")}, .forgotPasswordButton: { print("forgot password button tapped")}]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        
    }
    private func loadData() {
        view.backgroundColor = .white
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.constrainEdgesToSuperview()
 
        viewModel.load { [weak self] (_) in
            if let dataV = self?.viewModel.components.first {
                for index in dataV.view.indices {
                    let dataValue = dataV.viewData[index]
                    let someView = dataV.view[index]
                    let tempView = someView.genrateUIView(padding: dataValue.properties?.padding, size: dataValue.properties?.size) 
                    if let button = someView as? CustomButton {
                        if let closure = self?.buttonActions[button.identifier] {
                            button.setButtonAction {
                                closure()
                            }
                        }
                        if let textField = someView as? CustomTextField {
                            textField.delegate = self
                        }
                    }
                    stackView.addArrangedSubview(tempView)

                }
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
