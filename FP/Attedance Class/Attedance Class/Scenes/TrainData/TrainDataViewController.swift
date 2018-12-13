//
//  TrainDataViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import JGProgressHUD
import Device

class TrainDataViewController: UIViewController {
    @IBOutlet weak var trainDataButton: UIButton!
    
    var user: UserModel = UserModel(_nrp: "5115100076", _password: "123456")
    let trainDataViewModel: TrainDataViewModel = TrainDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trainDataButton.rounded()
    }
    
    @IBAction func trainDataButtonPressed(_ sender: UIButton) {
        initViewModel()
        self.checkReachability()
    }
    
    func checkReachability() {
        var hud = self.showProgressHUD(msg: "Loading")
        ConnectionUtil.isReachable(completed: { (_) in
            self.trainDataViewModel.trainData().subscribe(onNext: { (result) in
                hud.dismiss()
                if result.message.prefix(1) == "R" {
                    hud = self.showProgressHUDWithError(msg: result.message)
                    self.delayWithSeconds(2, completion: {
                        hud.dismiss()
                    })
                } else if result.message.prefix(1) == "A" {
                    hud = self.showProgressHUDWithSuccess(msg: result.message)
                    self.delayWithSeconds(2, completion: {
                        hud.dismiss()
                        self.navigationController?.popToRootViewController(animated: true)
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
    
    func initViewModel() {
        self.trainDataViewModel.user = self.user
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

extension TrainDataViewController {
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
