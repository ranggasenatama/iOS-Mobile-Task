//
//  AbsentRequestData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class AbsentRequestData {
    public let user: UserModelData
    public let image: String
    public let agenda: AgendaModelData
    
    public init(_user: UserModelData, _image: String, _agenda: AgendaModelData) {
        self.user = _user
        self.image = _image
        self.agenda = _agenda
    }
}
