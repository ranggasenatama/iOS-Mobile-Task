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
    @IBOutlet weak var timer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func cameraIconPressed(_ sender: UIBarButtonItem) {
        CameraHandler.shared.camera(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.imageViewPhoto.image = image
        }
    }
    
    @IBAction func uploadImageButtonPressed(_ sender: UIButton) {
        guard var image = imageViewPhoto.image else { fatalError("photo is nill") }
        image = image.resize(withWidth: 200)!
        uploadImage(image: image)
    }
    
    func uploadImage(image: UIImage) {
        let apiLink = "http://mobile.if.its.ac.id/kirimgambar"
        let nrp = "5115100076"
        let base64String = "data:image/png;base64,"+convertImageToBase64(image: image)
        
        let parameters = [
            "nrp": nrp,
            "image": base64String
        ]
        
        let start = Date()
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
                    self.progressHUD(current: progress.fractionCompleted)
                })

                upload.responseJSON { response in
                    RappleActivityIndicatorView.stopAnimation(completionIndicator: .success, completionLabel: "Completed.", completionTimeout: 1.0)
                    let end = Date()
                    self.timer.text = "Time needed :\(start.elapsedTime(to: end))"
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
    
    func progressHUD(current: Double) {
        RappleActivityIndicatorView.setProgress(CGFloat(current), textValue: "\(Int(current*100))%")
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
    
    //
    // Convert String to base64
    //
    func convertImageToBase64(image: UIImage) -> String {
        let imageData = UIImagePNGRepresentation(image)!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    
    //
    // Convert base64 to String
    //
    func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
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

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

extension Date {
    func elapsedTime(to date: Date) -> String {
        
        let attoseconds100 = date.timeIntervalSince(self) * 10000000000000
        
        switch attoseconds100 {
        case 6048000000000000000...:
            let weeks : Int = Int(attoseconds100 / 6048000000000000000)
            return "\(weeks)w" + " " + "\(Int(attoseconds100 / 864000000000000000) - (weeks * 7))d"
            
        case 864000000000000000...:
            let days : Int = Int(attoseconds100 / 864000000000000000)
            return "\(days)d" + " " + "\(Int(attoseconds100 / 36000000000000000) - (days * 24))h"
            
        case 36000000000000000...:
            let hours : Int = Int(attoseconds100 / 36000000000000000)
            return "\(hours)h" + " " + "\(Int(attoseconds100 / 600000000000000) - (hours * 60))m"
            
        case 600000000000000...:
            let mins : Int = Int(attoseconds100 / 600000000000000)
            return "\(mins)m" + " " + "\(Int(attoseconds100 / 10000000000000) - (mins * 60))s"
            
        case 10000000000000...:
            let secs : Int = Int(attoseconds100 / 10000000000000)
            return "\(secs)s" + " " + "\(Int(attoseconds100 / 10000000000) - (secs * 1000))ms"
            
        case 10000000000...:
            let millisecs : Int = Int(attoseconds100 / 10000000000)
            return "\(millisecs)ms" + " " + "\(Int(attoseconds100 / 10000000) - (millisecs * 1000))μs"
            
        case 10000000...:
            let microsecs : Int = Int(attoseconds100 / 10000000)
            return "\(microsecs)μs" + " " + "\(Int(attoseconds100 / 10000) - (microsecs * 1000))ns"
            
        case 10000...:
            let nanosecs : Int = Int(attoseconds100 / 10000)
            return "\(nanosecs)ns" + " " + "\(Int(attoseconds100 / 10) - (nanosecs * 1000))ps"
            
        case 10...:
            let picosecs : Int = Int(attoseconds100 / 10)
            return "\(picosecs)ps" + " " + "\(Int(attoseconds100 / 0.01) - (picosecs * 1000))fs"
            
        case 0.01...:
            let femtosecs : Int = Int(attoseconds100 * 100)
            return "\(femtosecs)fs" + " " + "\((Int(attoseconds100 / 0.001) - (femtosecs * 10)) * 100)as"
        case 0.001...:
            return "\(Int(attoseconds100 * 100000))as"
            
        default:
            return "Less than 100 attoseconds"
        }
    }
}
