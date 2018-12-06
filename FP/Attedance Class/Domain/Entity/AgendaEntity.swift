//
//  Agenda.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 06/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class AgendaEntity {
    public let Lat: String
    public let Lon: String
    public let idAgenda: String

    public init(_lat: String, _lon: String, _idAgenda: String) {
        self.Lat = _lat
        self.Lon = _lon
        self.idAgenda = _idAgenda
    }
}
