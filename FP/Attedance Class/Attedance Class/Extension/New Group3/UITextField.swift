//
//  UITextField.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 10/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit

extension UITextField {
    func rounded() {
        
        // set rounded and white border
        self.layer.cornerRadius = 25
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        
        // set placeholder to light gray
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.lightGray])
    }
}
