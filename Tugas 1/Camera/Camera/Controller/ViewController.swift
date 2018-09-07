//
//  ViewController.swift
//  Camera
//
//  Created by Rangga Senatama Putra on 03/09/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cameraImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func photoLibraryButtonPressed(_ sender: UIButton) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.cameraImageView.image = image
        }
    }
}

