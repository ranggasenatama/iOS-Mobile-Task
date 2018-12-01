//
//  PredictEntity.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class PredictEntity {
    public let username: String
    public let password: String
    public let image: Data
    
    public init(_username: String, _password: String, _image: Data) {
        self.username = _username
        self.password = _password
        self.image = _image
    }
}
