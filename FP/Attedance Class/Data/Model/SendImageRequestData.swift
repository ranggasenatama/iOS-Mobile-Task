//
//  SendImageRequestData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class SendImageRequestData {
    public let user: UserModelData
    public let image: String
    
    public init(_user: UserModelData, _image: String) {
        self.user = _user
        self.image = _image
    }
}
