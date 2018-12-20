//
//  SignatureAbsentRequestEntity.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 20/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class SignatureAbsentRequestEntity {
    public let user: UserEntity
    public let image: ImageEntity
    public let agenda: AgendaEntity
    
    public init(_user: UserEntity, _image: ImageEntity, _agenda: AgendaEntity) {
        self.user = _user
        self.image = _image
        self.agenda = _agenda
    }
}
