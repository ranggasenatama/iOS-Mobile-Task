//
//  ResponseEntity.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class PredictResponseEntity {
    public let statusCode: Int
    public let message: String
    
    public init(_statusCode: Int, _message: String) {
        self.statusCode = _statusCode
        self.message = _message
    }
}
