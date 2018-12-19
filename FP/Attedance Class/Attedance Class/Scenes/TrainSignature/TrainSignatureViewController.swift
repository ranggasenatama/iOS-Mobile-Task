//
//  TrainSignatureViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import JGProgressHUD
import Device

class TrainSignatureViewController: UIViewController {
    
    @IBOutlet weak var trainButton: UIButton!
    var user: UserModel = UserModel(_nrp: "5115100076", _password: "123456")
    
    var trainSignatureViewModel: TrainSignatureViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trainButton.rounded()
    }
    
    @IBAction func trainButtonPressed(_ sender: UIButton) {
        self.trainSignatureViewModel = TrainSignatureViewModel(_user: user)
        self.checkReachability()
    }
    
    func checkReachability() {
        var hud = self.showProgressHUD(msg: "Loading")
        ConnectionUtil.isReachable(completed: { (_) in
            self.trainSignatureViewModel.trainSignature().subscribe(onNext: { (result) in
                hud.dismiss()
                if result.message.prefix(1) == "A" {
                    hud = self.showProgressHUDWithSuccess(msg: result.message)
                    self.delayWithSeconds(2, completion: {
                        hud.dismiss()
                        self.navigationController?.popToRootViewController(animated: true)
                    })
                } else {
                    hud = self.showProgressHUDWithError(msg: result.message)
                    self.delayWithSeconds(2, completion: {
                        hud.dismiss()
                    })
                }
            }, onError: { (error) in
                print("error")
            }, onCompleted: nil, onDisposed: nil)
        })
        ConnectionUtil.isUnreachable(completed: { (_) in
            hud.dismiss()
            hud = self.showProgressHUDWithError(msg: "No connection")
            self.delayWithSeconds(2, completion: {
                hud.dismiss()
            })
        })
    }
    
    
    func showProgressHUD(msg: String) -> JGProgressHUD {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = msg
        hud.show(in: self.view)
        return hud
    }
    
    func showProgressHUDWithError(msg: String) -> JGProgressHUD  {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = msg
        hud.indicatorView = JGProgressHUDErrorIndicatorView.init()
        hud.show(in: self.view)
        return hud
    }
    
    func showProgressHUDWithSuccess(msg: String) -> JGProgressHUD {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = msg
        hud.indicatorView = JGProgressHUDSuccessIndicatorView.init()
        hud.show(in: self.view)
        return hud
    }
}

extension TrainSignatureViewController {
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
