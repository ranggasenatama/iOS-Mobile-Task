//
//  ViewController.swift
//  Upload Image
//
//  Created by Rangga Senatama Putra on 07/09/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import Alamofire
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraIconPressed(_ sender: UIBarButtonItem) {
        CameraHandler.shared.photoLibrary(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.imageViewPhoto.image = image
        }
    }
    
    @IBAction func uploadImageButtonPressed(_ sender: UIButton) {
        guard let image = imageViewPhoto.image else { fatalError("photo is nill") }
        let imageData = UIImagePNGRepresentation(image)!
        
        let parameters = [
            "image": "swift_file.png"
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData, withName: "image", fileName: "swift_file.png", mimeType: "image/png")
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to:"http://localhost:8000/api/image-upload")
        { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { (progress) in
//                    print(progress)
                })
                upload.responseString { response in
//                    print(response)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
    
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
    }
    
}

