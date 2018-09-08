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
import RappleProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func cameraIconPressed(_ sender: UIBarButtonItem) {
        CameraHandler.shared.photoLibrary(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.imageViewPhoto.image = image
        }
    }
    
    @IBAction func uploadImageButtonPressed(_ sender: UIButton) {
        guard var image = imageViewPhoto.image else { fatalError("photo is nill") }
        image = image.resize(withWidth: 200)!
        let imageData = UIImagePNGRepresentation(image)!
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData, withName: "image", fileName: "swift_file.png", mimeType: "image/png")
        }, to:"http://localhost:8000/api/image-upload")
        { (result) in
            switch result {
            case .success(let upload, _, _):
                let attributes = RappleActivityIndicatorView.attribute(style: RappleStyle.circle)
                RappleActivityIndicatorView.startAnimatingWithLabel("Uploading..." ,attributes: attributes)
                upload.uploadProgress(closure: { (progress) in
                    self.progressHUD(current: progress.completedUnitCount, total: progress.totalUnitCount)
                })
                upload.responseString { response in
                    RappleActivityIndicatorView.stopAnimation(completionIndicator: .success, completionLabel: "Completed.", completionTimeout: 1.0)
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
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            print("User do not have access to photo album.")
        case .denied:
            print("User has denied the permission.")
        }
    }
    
    func progressHUD(current: Int64, total: Int64) {
        let currentProgress: CGFloat = CGFloat(current) / CGFloat(total)
        RappleActivityIndicatorView.setProgress(currentProgress, textValue: "\(currentProgress)")
    }
    
}

extension UIImage {
    func resize(withWidth newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
