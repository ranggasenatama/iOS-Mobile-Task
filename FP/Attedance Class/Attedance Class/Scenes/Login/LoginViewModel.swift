//
//  LoginViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 10/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit

class LoginViewModel {
    var nrp: String!
    var password: String!
    
    init(_nrp: String, _password: String) {
        self.nrp = _nrp
        self.password = _password
    }
    
    func isValidNRP() -> Bool {
        if self.nrp == "5115100076" {
            return true
        }
        return false
    }
    
    func isValidPassword() -> Bool {
        if self.password == "123456" {
            return true
        }
        return false
    }
}
