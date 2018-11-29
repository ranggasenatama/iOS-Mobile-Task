//
//  GetQRCodeViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 28/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import Domain
import Device

class GetLocationViewModel {
    var agenda: String!
    var longtitude: String!
    var latitude: String!
    
    let coordinateRepository: CoordinateRepository = CoordinateRepositoryDevice()
    
    func transfrom(input: String) {
        let output = input.split(separator: ",")
        latitude = String(output[0])
        longtitude = String(output[1])
        agenda = String(output[2])
    }
    
    func isInRangeLocation() -> Bool {
        let currentLocation = coordinateRepository.getCoordinate()
        let agendaQRCode = CoordinateEntity(_longtitude: Double(longtitude)!, _latitude: Double(latitude)!)
        let meters = coordinateRepository.calculateDistance(coordinate1: currentLocation, coordinate2: agendaQRCode)
        print(meters)
        return meters <= 10
    }
}
