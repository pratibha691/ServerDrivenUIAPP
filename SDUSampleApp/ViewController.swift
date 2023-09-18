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
    }


}

