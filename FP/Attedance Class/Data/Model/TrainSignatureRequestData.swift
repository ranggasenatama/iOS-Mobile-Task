//
//  TrainSignatureRequestData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class TrainSignatureRequestData {
    public let user: UserModelData
    
    public init(_user: UserModelData) {
        self.user = _user
    }
}
