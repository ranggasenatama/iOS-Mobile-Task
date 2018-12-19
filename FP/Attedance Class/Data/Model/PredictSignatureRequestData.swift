//
//  PredictSignatureRequestData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class PredictSignatureRequestData {
    public let user: UserModelData
    public let image: String
    
    public init(_user: UserModelData, _image: String) {
        self.user = _user
        self.image = _image
    }
}
