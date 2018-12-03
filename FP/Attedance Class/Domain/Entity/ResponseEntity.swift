//
//  ResponseEntity.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class ResponseEntity {
    public let statusCode: String
    public let message: String
    
    public init(_statusCode: String, _message: String) {
        self.statusCode = _statusCode
        self.message = _message
    }
}
