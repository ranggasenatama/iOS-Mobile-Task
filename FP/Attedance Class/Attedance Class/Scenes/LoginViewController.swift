//
//  LoginViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 10/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var nrpTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nrpTextField.rounded()
        passwordTextField.rounded()
        loginButton.rounded()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "home", sender: self)
    }
}

extension LoginViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "home" {
            print("home")
        }
    }
}
