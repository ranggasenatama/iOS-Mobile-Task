//
//  TrainSignatureRequestEntity.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class TrainSignatureRequestEntity {
    public let user: UserEntity
    
    public init(_user: UserEntity) {
        self.user = _user
    }
}