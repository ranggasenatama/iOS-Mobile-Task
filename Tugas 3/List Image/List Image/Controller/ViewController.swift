//
//  ViewController.swift
//  List Image
//
//  Created by Rangga Senatama Putra on 17/09/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController  {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self //Set the delegate
        myTableView.dataSource = self //Set the datasource
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        myTableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondView") as! SecondViewController
        vc.currentItem = nil
        self.present(vc, animated: false, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DBManager.sharedInstance.getDataFromDB().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as UITableViewCell
        
        let index = Int(indexPath.row)
        let item = DBManager.sharedInstance.getDataFromDB()[index] as Item
        cell.textLabel?.text = item.textString
        
        print("data image \(item.imagePath)")
        let image: UIImage = UIImage(contentsOfFile: item.imagePath)!
        print(image)
        
        cell.imageView?.image = image
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if( indexPath.row > -1) {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondView") as! SecondViewController
            
            let index = Int(indexPath.row)
            let item = DBManager.sharedInstance.getDataFromDB()[index] as Item
            
            vc.currentItem = item
            self.present(vc, animated: false, completion: nil)
        }
    }
}
