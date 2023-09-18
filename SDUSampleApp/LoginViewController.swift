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
        viewModel = LoginViewModel(service: LocalService())
        viewModel.load()
    }


}

