//
//  PredictViewController.swift
//  List Image
//
//  Created by Rangga Senatama Putra on 04/10/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import RappleProgressHUD
import SwiftyJSON

class PredictViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.imageView.image = image
        }
    }
    
    @IBAction func predictCheckPressed(_ sender: Any) {
        let image = imageView.image?.resize(withWidth: 512)
        upload(image: image!)
    }
    
    func upload(image: UIImage) {
        let apiLink = "http://mobile.if.its.ac.id/predict"
        let nrp = "5115100001"
        let base64String = convertImageToBase64(image: image)
        
        let parameters = [
            "nrp": nrp,
            "image": base64String
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: apiLink)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                let attributes = RappleActivityIndicatorView.attribute(style: RappleStyle.circle)
                RappleActivityIndicatorView.startAnimatingWithLabel("Uploading..." ,attributes: attributes)
                
                upload.uploadProgress(closure: { (progress) in
                    
                })
                
                upload.responseJSON { response in
                    RappleActivityIndicatorView.stopAnimation(completionIndicator: .success, completionLabel: "Completed.", completionTimeout: 1.0)
                    print(response)
                    
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
    
    //
    // Convert String to base64
    //
    func convertImageToBase64(image: UIImage) -> String {
        let imageData = UIImagePNGRepresentation(image)!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
}
