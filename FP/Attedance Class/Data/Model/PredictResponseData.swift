//
//  PredictResponseData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 05/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class PredictResponseData {
    public let msg: String
    public let statusCode: Int
    
    public init(_statusCode: Int, _msg: String) {
        self.msg = _msg
        self.statusCode = _statusCode
    }
}
