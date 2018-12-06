//
//  SuccesViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 29/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    @IBOutlet weak var statusCode: UILabel!
    @IBOutlet weak var message: UILabel!
    
    var statusCodeVar: String!
    var messageVar: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.statusCode.text = self.statusCodeVar
        self.message.text = self.messageVar
    }
    
}
