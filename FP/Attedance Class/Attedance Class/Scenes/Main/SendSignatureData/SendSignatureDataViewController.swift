//
//  File.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import YPDrawSignatureView
import Device
import JGProgressHUD

class SendSignatureDataViewController: UIViewController {
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var signatureView: YPDrawSignatureView!
    
    var sendSignatureViewModel: SendSignatureDataViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.rounded()
        clearButton.rounded()
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        guard let image = self.signatureView.getSignature() else {
            fatalError("get image signature")
        }
        self.sendSignatureViewModel = SendSignatureDataViewModel(_signature: image)
        
        var hud = self.showProgressHUD(msg: "Loading")
        
        ConnectionUtil.isReachable(completed: { (_) in
            self.sendSignatureViewModel.sendSignature().subscribe(onNext: { (result) in
                hud.dismiss()
                if result.message.prefix(1) == "R" {
                    hud = self.showProgressHUDWithError(msg: result.message)
                    self.delayWithSeconds(2, completion: {
                        hud.dismiss()
                    })
                } else if result.message.prefix(1) == "T" {
                    hud = self.showProgressHUDWithSuccess(msg: result.message)
                    self.delayWithSeconds(2, completion: {
                        hud.dismiss()
                        self.navigationController?.popToRootViewController(animated: true)
                    })
                }
            }, onError: { (error) in
                print(error)
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
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        self.signatureView.clear()
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

extension SendSignatureDataViewController {
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
