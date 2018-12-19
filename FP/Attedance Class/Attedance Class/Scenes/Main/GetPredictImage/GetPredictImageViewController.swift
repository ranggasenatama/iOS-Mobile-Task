//
//  GetPredictImageViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import JGProgressHUD
import Device

class GetPredictImageViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var predictButton: UIButton!
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    var user: UserModel = UserModel(_nrp: "5115100076", _password: "123456")
    var image: UIImage!
    let getPredictImageViewModel: GetPredictImageViewModel = GetPredictImageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        predictButton.rounded()
    }
    
    @IBAction func predictButtonPressed(_ sender: UIButton) {
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        stillImageOutput.capturePhoto(with: settings, delegate: self)
        self.captureSession.stopRunning()
        
        var hud = self.showProgressHUD(msg: "Loading")
        
        self.delayWithSeconds(1) {
            ConnectionUtil.isReachable(completed: { (_) in
                self.initViewModel()
                self.getPredictImageViewModel.makePredict().subscribe(onNext: { (result) in
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
                            self.captureSession.startRunning()
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
    
    func initViewModel() {
        self.getPredictImageViewModel.user = self.user
        self.getPredictImageViewModel.image = self.image
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

extension GetPredictImageViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.medium
        guard let frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .front)
            else {
                print("Unable to access front camera!")
                return
        }
        do {
            let input = try AVCaptureDeviceInput(device: frontCamera)
            stillImageOutput = AVCapturePhotoOutput()
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
            }
        }
        catch let error  {
            print("Error Unable to initialize front camera:  \(error.localizedDescription)")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.captureSession.stopRunning()
    }
    
    func setupLivePreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspectFill
        videoPreviewLayer.connection?.videoOrientation = .portrait
        cameraView.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.cameraView.bounds
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { fatalError("Error get data image") }
        
        let image = UIImage(data: imageData)
        self.image = image
    }
}

extension GetPredictImageViewController {
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
