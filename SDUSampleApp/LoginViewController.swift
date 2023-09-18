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
        viewModel.load()
        let aa = CustomLabel(attributes: LabelConfigration(textColor: .green, font: .systemFont(ofSize: 20)))
        aa.text = "hello"
        contentView.addArrangedSubview(aa)
        /*
        aa.translatesAutoresizingMaskIntoConstraints = false
        aa.widthAnchor.constraint(equalToConstant: 150).isActive = true
        aa.heightAnchor.constraint(equalToConstant: 150).isActive = true
        aa.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aa.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
*/
    }


}

