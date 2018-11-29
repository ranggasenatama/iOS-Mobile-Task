//
//  ShowAgendaScan.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 28/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit

class ShowAgendaScan: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
}
