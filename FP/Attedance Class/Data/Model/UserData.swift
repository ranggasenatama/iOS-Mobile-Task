//
//  UserData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class UserData {
    public let nrp: String
    public let password: String
    
    public init(_nrp: String, _password: String) {
        self.nrp = _nrp
        self.password = _password
    }
}
