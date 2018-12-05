//
//  Coordinate.swift
//  Device
//
//  Created by Rangga Senatama Putra on 27/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class CoordinateDevice {
    var longitude: Double!
    var latitude: Double!
    
    public init(_longitude: Double, _latitude: Double) {
        self.latitude = _latitude
        self.longitude = _longitude
    }
    
    public func set(_longitude: Double, _latitude: Double) {
        self.latitude = _latitude
        self.longitude = _longitude
    }
}
