//
//  GetRangeTwoCoordniateInMetersUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 05/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class GetRangeTwoCoordinateInMetersUseCase {
    var coordinateRepository: CoordinateRepository
    
    public init(_coordinateRepository: CoordinateRepository) {
        self.coordinateRepository = _coordinateRepository
    }
    
    public func invoke(_coordinate1: CoordinateEntity, _coordinate2: CoordinateEntity) -> Double {
        return coordinateRepository.calculateDistance(coordinate1: _coordinate1, coordinate2: _coordinate2)
    }
}
