//
//  SecondViewController.swift
//  List Image
//
//  Created by Rangga Senatama Putra on 18/09/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var currentItem: Item?

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = currentItem {
            txtField.text = item.textString
            imageView.image = UIImage(contentsOfFile: item.imagePath)
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
        DBManager.sharedInstance.addData(object: item)
        
        self.dismiss(animated: true) { }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        if let item = currentItem {
            DBManager.sharedInstance.deleteFromDb(object: item)
            self.dismiss(animated: true) { }
        }
    }
    

}
