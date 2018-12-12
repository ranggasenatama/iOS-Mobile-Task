//
//  CoordinateRepositoryDevice.swift
//  Device
//
//  Created by Rangga Senatama Putra on 27/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import CoreLocation

public class CoordinateRepositoryDevice: CoordinateRepository {
    let locationUtil: LocationUtil = LocationUtil()
    let coordinateMapper: MapperBase<CoordinateEntity, CoordinateDevice> = CoordinateMapper()
    
    public init(){

    }
    
    public func getCoordinate() -> CoordinateEntity {
        let coordinate = CoordinateDevice(_longitude: locationUtil.longtitude, _latitude: locationUtil.latitude)
        
        return coordinateMapper.mapToEntity(model: coordinate)
    }
    
    public func calculateDistance(coordinate1: CoordinateEntity, coordinate2: CoordinateEntity) -> Double {
        let data1 = CLLocation(latitude: coordinate1.latitude, longitude: coordinate1.longtitude)
        let data2 = CLLocation(latitude: coordinate2.latitude, longitude: coordinate2.longtitude)
        print("2 \(data2.coordinate.latitude) - \(data2.coordinate.longitude)")
        print("1 \(data1.coordinate.latitude) - \(data1.coordinate.longitude)")
        let distanceInMeters = data1.distance(from: data2)
        return distanceInMeters
    }
}
