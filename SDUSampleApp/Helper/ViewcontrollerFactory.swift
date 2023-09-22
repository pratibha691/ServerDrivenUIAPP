//
//  ViewcontrollerFactory.swift
//  NewsApp
//
//  Created by Pratibha Gupta on 20/09/23.
//

import Foundation

class ViewControllerFactory {
    
    static func createLoginViewController() -> LoginViewController {
       let loginVC: LoginViewController = LoginViewController()
        loginVC.viewModel = LoginViewModel(service: LocalService())
        return loginVC
    }
}
