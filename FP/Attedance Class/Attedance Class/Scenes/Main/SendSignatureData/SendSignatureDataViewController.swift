//
//  File.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import YPDrawSignatureView

class SendSignatureDataViewController: UIViewController {
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var signatureView: YPDrawSignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.rounded()
        clearButton.rounded()
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        self.signatureView.clear()
    }
    
    
}
