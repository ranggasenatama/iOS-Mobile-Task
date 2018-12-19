//
//  PredictSignatureRequestEntity.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class PredictSignatureRequestEntity {
    public let user: UserEntity
    public let image: ImageEntity
    
    public init(_user: UserEntity, _image: ImageEntity) {
        self.user = _user
        self.image = _image
    }
}
