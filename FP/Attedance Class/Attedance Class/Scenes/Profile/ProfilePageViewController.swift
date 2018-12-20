//
//  ProfilePageViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 20/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import ChameleonFramework

class ProfilePageViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configUI() {
        let colors:[UIColor] = [
            UIColor.flatBlackDark,
            UIColor.flatBlueDark
        ]
        topView.backgroundColor = GradientColor(.topToBottom, frame: view.frame, colors: colors)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ProfilePageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! ProfilePageTableViewCell
        
        // set the text from the data model
        (cell as! ProfilePageTableViewCell).textLabelProfile.text = "Logout"
        (cell as! ProfilePageTableViewCell).imageViewProfile.image = UIImage(named: "icon-logout")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.flatWhite
        
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 8, width: self.view.frame.size.width - 20, height: 66))
        
        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.9])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
    }
}
