//
//  ViewcontrollerFactory.swift
//  NewsApp
//
//  Created by Pratibha Gupta on 20/09/23.
//

import Foundation

class ViewControllerFactory {
    
    static func createLoginViewController() -> LoginViewController {
       let loginVC: LoginViewController = LoginViewController.instantiateFromStoryboard(named: .main)
        loginVC.viewModel = LoginViewModel(service: LocalService())
        return loginVC
    }
}
