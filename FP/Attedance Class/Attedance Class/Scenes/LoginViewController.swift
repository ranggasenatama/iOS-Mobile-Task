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
import Reachability

protocol isAbleToReceiveData {
    func pass(user: UserModel)  //data: string is an example parameter
}

class LoginViewController: UIViewController {
    @IBOutlet weak var nrpTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var delegate: isAbleToReceiveData?
    
    let connection = ConnectionUtil.sharedInstance
    var loginViewModel: LoginViewModel!
    var workItem: DispatchWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonRounded()
        isReachableConnection()
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
        
        if isValidUser() {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension LoginViewController {
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        workItem?.cancel()
        delegate?.pass(user: UserModel(_nrp: loginViewModel.nrp, _password: loginViewModel.password))
    }
    
    func isReachableConnection() {
        ConnectionUtil.isUnreachable { networkManagerInstance in
            self.messageConnection()
        }
        connection.reachability.whenUnreachable = { reachability in
            self.messageConnection()
        }
    }
    
    func item() {
        workItem = DispatchWorkItem{
            self.viewDidLoad()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: workItem!)
    }
    
    func messageConnection() {
        let messageWithAction = MDCSnackbarMessage()
        let action = MDCSnackbarMessageAction()
        workItem?.cancel()
        messageWithAction.text = "You are offline, Check your connection"
        let actionHandler = {() in
            self.viewDidLoad()
            self.workItem?.cancel()
        }
        action.handler = actionHandler
        action.title = "Retry"
        messageWithAction.action = action
        messageWithAction.duration = 10
        item()
        MDCSnackbarManager.show(messageWithAction)
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
            message.text = "Your NRP or Password is Wrong"
            MDCSnackbarManager.show(message)
            return false
        }
        return true
    }
}
