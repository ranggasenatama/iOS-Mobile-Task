//
//  LoginViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 10/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import MaterialComponents
import Device
import JGProgressHUD

protocol isAbleToReceiveData {
    func pass(user: UserModel)
}

class LoginViewController: UIViewController {
    @IBOutlet weak var nrpTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var delegate: isAbleToReceiveData?
    
    let connection = ConnectionUtil.sharedInstance
    var loginViewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonRounded()
    }
    
    func buttonRounded() {
        nrpTextField.rounded()
        passwordTextField.rounded()
        loginButton.rounded()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        loginViewModel = LoginViewModel(_nrp: self.nrpTextField.text!, _password: self.passwordTextField.text!)
        
        if self.isValidUser() {
            var hud = self.showProgressHUD(msg: "Loading")
            self.delayWithSeconds(1) {
                hud.dismiss()
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }
}

extension LoginViewController {
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.pass(user: UserModel(_nrp: loginViewModel.nrp, _password: loginViewModel.password))
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
        let message = MDCSnackbarMessage()

        if loginViewModel.isNRPNil() {
            message.text = "NRP is Required"
            MDCSnackbarManager.show(message)
            return false
        } else if loginViewModel.isPasswordNil() {
            message.text = "Password is Required"
            MDCSnackbarManager.show(message)
            return false
        } else if loginViewModel.isNotValidNRPOrPassword() {
            var hud = self.showProgressHUD(msg: "Loading")
            self.delayWithSeconds(1) {
                hud.dismiss()
                message.text = "Your NRP or Password is Wrong"
                MDCSnackbarManager.show(message)
            }
            return false
        } else {
            return true
        }
    }
    
    func showProgressHUD(msg: String) -> JGProgressHUD {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = msg
        hud.show(in: self.view)
        return hud
    }
}

extension LoginViewController {
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
