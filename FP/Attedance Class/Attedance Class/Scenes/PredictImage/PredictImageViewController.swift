//
//  ViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 26/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import Device

class PredictImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var data: String!
    var nrp: String!
    var password: String!
    var statusCode: Int!
    var agenda: String!
    var lat: String!
    var lon: String!
    
    let predictImageViewModel: PredictImageViewModel = PredictImageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPage()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        CameraUtils.shared.showActionSheet(vc: self)
        CameraUtils.shared.imagePickedBlock = { (image) in
            self.imageView.image = image
        }
    }
    
    @IBAction func predictButtonPressed(_ sender: Any) {
        predictImageViewModel.nrp = self.nrp
        predictImageViewModel.password = self.password
        predictImageViewModel.image = imageView.image
        predictImageViewModel.lat = self.lat
        predictImageViewModel.lon = self.lon
        predictImageViewModel.agenda = self.agenda
        
        predictImageViewModel.makePredict().subscribe(onNext: { (result) in
            self.data = result.message
            self.statusCode = result.statusCode
            
            self.performSegue(withIdentifier: "berhasil", sender: self)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
    }
}

extension PredictImageViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "berhasil" {
            if let succesViewController = segue.destination as? SuccessViewController {
                print("data \(self.data)")
                print("status code \(self.statusCode)")
                succesViewController.statusCodeVar = "Status code: \(self.statusCode!)"
                succesViewController.messageVar = self.data
            }
        }
    }
}

extension PredictImageViewController {
    func loginPage() {
        // 1
        let loginController = UIAlertController(title: "Please Sign In", message: "Fill in the following", preferredStyle: UIAlertControllerStyle.alert)
        // 2
        let loginAction = UIAlertAction(title: "Log In", style: UIAlertActionStyle.default) { (action:UIAlertAction) -> Void in
            
            let loginTextField = loginController.textFields![0] as! UITextField
            
            let passwordTextField = loginController.textFields![1] as! UITextField
            
            self.nrp = loginTextField.text!
            self.password = passwordTextField.text!
            print(self.nrp)
            print(self.password)
        }
        loginAction.isEnabled = true
        // 4
        loginController.addTextField { (textField:UITextField!) -> Void in
            
            textField.placeholder = "Username or Email"
            
            textField.keyboardType = UIKeyboardType.default
            
        }
        // 5
        loginController.addTextField { (textField:UITextField!) -> Void in
            
            textField.placeholder = "Password"
            
            textField.isSecureTextEntry = true
            
        }
        // 6
        loginController.addAction(loginAction)
        // 7
        present(loginController, animated: true, completion: nil)
    }
}
