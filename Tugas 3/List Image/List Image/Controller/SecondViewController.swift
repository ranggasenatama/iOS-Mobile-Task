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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = currentItem {
            txtField.text = item.textString
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let item = Item()
        if(currentItem == nil) {
            // if is a new Item then calculate a new ID, else use the current ID
            item.ID = DBManager.sharedInstance.getDataFromDB().count
        }
        item.textString = txtField.text!
        DBManager.sharedInstance.addData(object: item)
        self.dismiss(animated: true) { }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        if let item = currentItem {
            DBManager.sharedInstance.deleteFromDb(object: item)
            self.dismiss(animated: true) { }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
