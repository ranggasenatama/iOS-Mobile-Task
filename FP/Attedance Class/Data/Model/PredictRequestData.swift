//
//  UserData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class PredictRequestData {
    public let nrp: String
    public let password: String
    public let image: String
    public let Lat: String
    public let Lon: String
    public let idAgenda: String

    
    public init(_nrp: String, _password: String, _image: String, _lat: String, _lon: String, _idAgenda: String) {
        self.nrp = _nrp
        self.password = _password
        self.image = _image
        self.Lat = _lat
        self.Lon = _lon
        self.idAgenda = _idAgenda
    }
}
