//
//  SecondViewController.swift
//  List Image
//
//  Created by Rangga Senatama Putra on 18/09/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import Alamofire
import RappleProgressHUD

class SecondViewController: UIViewController {

    var currentItem: Item?

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = currentItem {
            txtField.text = item.textString
            imageView.image = UIImage(contentsOfFile: item.imagePath)
            timeText.text = item.timeNeeded
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageChoosen() {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.imageView.image = image
        }
    }
    
    @IBAction func cameraUploadPressed(_ sender: UIButton) {
        imageChoosen()
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        imageChoosen()
    }
    
    @IBAction func uploadImage(_ sender: UIButton) {
        let image = imageView.image?.resize(withWidth: 512)
        upload(image: image!)
    }
    
    func upload(image: UIImage) {
        let apiLink = "http://mobile.if.its.ac.id/kirimgambar"
        let nrp = "5115100001"
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
                    self.timeText.text = "Time needed :\(start.elapsedTime(to: end))"
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
    
    func saveImage(img: UIImage, imgName: String) -> String {
        let fileManager = FileManager.default
        
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let documentsPath = documentsURL.path
        
        //final path
        let filePath = documentsURL.appendingPathComponent("\(imgName).png")
        print(filePath)
        
        //check existing image
        do {
            let files = try fileManager.contentsOfDirectory(atPath: "\(documentsPath)")
            
            for file in files {
                if "\(documentsPath)/\(file)" == filePath.path {
                    try fileManager.removeItem(atPath: filePath.path)
                }
            }
        } catch {
            print("erorr check image")
        }
        
        //create imageData and write it to filePath
        do {
            if let pngImage = UIImagePNGRepresentation(img) {
                try pngImage.write(to: filePath, options: .atomic)
            }
        } catch {
            print("Error write to filePath")
        }
        
        return filePath.path
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let item = Item()
        if(currentItem == nil) {
            // if is a new Item then calculate a new ID, else use the current ID
            item.ID = DBManager.sharedInstance.getDataFromDB().count
        }
        item.textString = txtField.text!
        item.imagePath = saveImage(img: imageView.image!, imgName: txtField.text!)
        item.timeNeeded = timeText.text!
        
        DBManager.sharedInstance.addData(object: item)
        
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
       // self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        if let item = currentItem {
            DBManager.sharedInstance.deleteFromDb(object: item)
            self.dismiss(animated: true) { }
        }
    }
    
    func progressHUD(current: Double) {
        RappleActivityIndicatorView.setProgress(CGFloat(current), textValue: "\(Int(current*100))%")
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
