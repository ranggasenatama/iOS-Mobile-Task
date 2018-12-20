//
//  GetPredictSignatureViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import YPDrawSignatureView
import JGProgressHUD
import Device

class GetPredictSignatureViewController: UIViewController {
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var predictButton: UIButton!
    @IBOutlet weak var signatureView: YPDrawSignatureView!
    
    var user: UserModel = UserModel(_nrp: "5115100076", _password: "123456")
    var image: UIImage!
    var getPredictSignatureViewModel: GetPredictSignatureViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        predictButton.rounded()
        clearButton.rounded()
    }
    
    @IBAction func predictButtonPressed(_ sender: UIButton) {
        self.image = signatureView.getSignature()
        initViewModel()
        checkReachability()
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        self.signatureView.clear()
    }
    
    func checkReachability() {
        var hud = self.showProgressHUD(msg: "Loading")
        ConnectionUtil.isReachable(completed: { (_) in
            self.getPredictSignatureViewModel.makePredictSignature().subscribe(onNext: { (result) in
                hud.dismiss()
                if result.message.prefix(5) == "TTD A" {
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
    
    func initViewModel() {
        self.getPredictSignatureViewModel = GetPredictSignatureViewModel(_user: user, _image: image)
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

extension GetPredictSignatureViewController {
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
