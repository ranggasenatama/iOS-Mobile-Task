//
//  PredictSignatureAbsentViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 20/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import YPDrawSignatureView
import JGProgressHUD
import Device

class PredictSignatureAbsentViewController: UIViewController {
    @IBOutlet weak var signatureView: YPDrawSignatureView!
    @IBOutlet weak var absentButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var user: UserModel = UserModel(_nrp: "5115100076", _password: "123456")
    var image: UIImage!
    var agenda: AgendaModel = AgendaModel(_lat: "-7.27952930", _lon: "112.79732590", _idAgenda: "IF184903_A_18")
    
    let predictSignatureViewModel: PredictSignatureAbsentViewModel = PredictSignatureAbsentViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        absentButton.rounded()
        cancelButton.rounded()
    }
    
    @IBAction func absentButtonPressed(_ sender: UIButton) {
        self.image = self.signatureView.getSignature()
        
        var hud = self.showProgressHUD(msg: "Loading")
        self.delayWithSeconds(1) {
            ConnectionUtil.isReachable(completed: { (_) in
                self.initViewModel()
                self.predictSignatureViewModel.makeSignatureAbsent().subscribe(onNext: { (result) in
                    hud.dismiss()
                    print(result.message)
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
                }, onError: nil, onCompleted: nil, onDisposed: nil)
            })
            ConnectionUtil.isUnreachable(completed: { (_) in
                hud.dismiss()
                hud = self.showProgressHUDWithError(msg: "No connection")
                self.delayWithSeconds(2, completion: {
                    hud.dismiss()
                })
            })
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        signatureView.clear()
    }
    
    func initViewModel() {
        self.predictSignatureViewModel.user = self.user
        self.predictSignatureViewModel.image = self.image
        self.predictSignatureViewModel.agenda = self.agenda
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

extension PredictSignatureAbsentViewController {
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
