//
//  SendImageRequestEntity.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class SendImageRequestEntity {
    public let user: UserEntity
    public let image: ImageEntity
    
    public init(_user: UserEntity, _image: ImageEntity) {
        self.user = _user
        self.image = _image
    }
}
