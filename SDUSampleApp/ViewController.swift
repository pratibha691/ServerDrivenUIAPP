//
//  ViewController.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LoginViewModel(service: LocalService()).load()
        let aa = CustomLabel(attributes: LabelConfigration(textColor: .green, font: .systemFont(ofSize: 20)))
        aa.text = "hello"
        self.view.addSubview(aa)
        /*
        aa.translatesAutoresizingMaskIntoConstraints = false
        aa.widthAnchor.constraint(equalToConstant: 150).isActive = true
        aa.heightAnchor.constraint(equalToConstant: 150).isActive = true
        aa.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aa.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
*/
    }


}

