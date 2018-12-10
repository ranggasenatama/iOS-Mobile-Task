//
//  LoginViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 10/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

class LoginViewController: UIViewController {
    @IBOutlet weak var nrpTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginViewModel: LoginViewModel!
    
    let message = MDCSnackbarMessage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nrpTextField.rounded()
        passwordTextField.rounded()
        loginButton.rounded()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        loginViewModel = LoginViewModel(_nrp: self.nrpTextField.text!, _password: self.passwordTextField.text!)
        
        if isValidUser() {
            performSegue(withIdentifier: "home", sender: self)
        }
    }
    
    
}

extension LoginViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "home" {
            print("home")
        }
    }
}

extension LoginViewController {
    func isValidUser() -> Bool {
        if loginViewModel.isNRPNil() {
            message.text = "NRP is Required"
            print(loginViewModel.isNRPNil())
            print(loginViewModel.nrp)
            MDCSnackbarManager.show(message)
            return false
        } else if loginViewModel.isPasswordNil() {
            message.text = "Password is Required"
            MDCSnackbarManager.show(message)
            return false
        } else if loginViewModel.isNotValidNRPOrPassword() {
            message.text = "Your NRP or Password is Wrong"
            MDCSnackbarManager.show(message)
            return false
        }
        return true
    }
}
