//
//  UserData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class PredictRequestData {
    public let user: UserModelData
    public let image: String

    public init(_user: UserModelData, _image: String) {
        self.user = _user
        self.image = _image
    }
}
