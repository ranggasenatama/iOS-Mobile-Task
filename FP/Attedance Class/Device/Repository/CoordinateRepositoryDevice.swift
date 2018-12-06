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
        let coordinate₀ = CLLocation(latitude: coordinate1.latitude, longitude: coordinate1.longtitude)
        let coordinate₁ = CLLocation(latitude: coordinate2.latitude, longitude: coordinate2.longtitude)
        print("2 \(coordinate2.latitude) - \(coordinate2.longtitude)")
        print("1 \(coordinate1.latitude) - \(coordinate1.longtitude)")
        let distanceInMeters = coordinate₀.distance(from: coordinate₁)
        return distanceInMeters
    }
    
    
}
