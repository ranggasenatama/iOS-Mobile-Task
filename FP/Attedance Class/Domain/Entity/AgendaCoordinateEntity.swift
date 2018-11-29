//
//  AgendaCoordinateEntity.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 28/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class AgendaCoordinateEntity {
    public let agenda: String
    public let coordinate: CoordinateEntity
    
    init(_agenda: String, _coordinate: CoordinateEntity) {
        self.agenda = _agenda
        self.coordinate = _coordinate
    }
}
