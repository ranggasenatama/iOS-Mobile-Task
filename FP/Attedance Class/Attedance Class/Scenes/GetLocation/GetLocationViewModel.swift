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

    let getCoordinateUseCase: GetCoordinateGPSUseCase = GetCoordinateGPSUseCase(_coordinateRepository: CoordinateRepositoryDevice())
    let getRangeTwoCoordinate: GetRangeTwoCoordinateInMetersUseCase = GetRangeTwoCoordinateInMetersUseCase(_coordinateRepository: CoordinateRepositoryDevice())

    func transfrom(input: String) {
        let output = input.split(separator: ",")
        latitude = String(output[0])
        longtitude = String(output[1])
        agenda = String(output[2])
    }

    func isInRangeLocation() -> Bool {
        let currentLocation = self.getCoordinateUseCase.invoke()
        let agendaQRCode = CoordinateEntity(_longtitude: Double(longtitude)!, _latitude: Double(latitude)!)
        let meters = self.getRangeTwoCoordinate.invoke(_coordinate1: currentLocation, _coordinate2: agendaQRCode)
        print(meters)
        return meters <= 10
    }
}
