//
//  GetCoordinateGPSUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 27/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class GetCoordinateGPSUseCase {
    var coordinateRepository: CoordinateRepository
    
    public init(_coordinateRepository: CoordinateRepository) {
        self.coordinateRepository = _coordinateRepository
    }
    
    public func invoke() -> CoordinateEntity {
        return coordinateRepository.getCoordinate()
    }
}
