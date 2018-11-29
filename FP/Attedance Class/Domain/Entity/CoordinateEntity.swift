//
//  Coordinate.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 26/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class CoordinateEntity {
    public let longtitude: Double
    public let latitude: Double
    
    public init(_longtitude: Double, _latitude: Double) {
        self.longtitude = _longtitude
        self.latitude = _latitude
    }
}
