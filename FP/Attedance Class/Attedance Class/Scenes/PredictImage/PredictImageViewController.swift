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
    
    let predictImageViewModel: PredictImageViewModel = PredictImageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        predictImageViewModel.nrp = "5115100003"
        predictImageViewModel.password = "teja5115003"
//        predictImageViewModel.nrp = "5115100174"
//        predictImageViewModel.password = "ronald123"
        predictImageViewModel.image = imageView.image
        predictImageViewModel.makePredict()
        performSegue(withIdentifier: "berhasil", sender: self)
    }
}
