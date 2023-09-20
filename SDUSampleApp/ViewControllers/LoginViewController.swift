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
        viewModel = LoginViewModel(service: LocalService(), buttonDelegate: self, textFieldDelegate: self)
        viewModel.load { [weak self] success in
            if let dataV = self?.viewModel.components.first {
                for someView in dataV.view {
                    let dataToShow = dataV.viewData.first(where: {$0.id == someView.tag})
                    let tempView = self?.genrateUIView(padding: dataToShow?.padding, viewG: someView) ?? UIView()
                    tempView.backgroundColor = .white
                    self?.contentView.addArrangedSubview(tempView)
                }
            }
        }
    }
}

extension LoginViewController: ButtonActionDelegate {
    // Implement the ButtonActionDelegate method to handle button actions.
      func handleButtonAction(_ action: ButtonAction) {
          switch action {
          case .login:
              // Handle login button action
              debugPrint("Handle login button action")
              break
          case .forgotPassword:
              // Handle forgot password button action
              debugPrint("Handle forgot password button action")
              break
          }
      }
}

extension LoginViewController: TextFieldActionDelegate {
    func handleTextFieldAction(_ identifier: String, value: String) {
        switch identifier {
        case "Login.Email":
            debugPrint(value)
            break
        case "Login.Password":
            debugPrint(value)
            break
        default:
            debugPrint("no data")
            break
        }
    }
}
