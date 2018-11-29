//
//  GetImageCameraUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 29/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class GetImageCameraUseCase {
    var coordinateRepository: CoordinateRepository
    
    public init(_coordinateRepository: CoordinateRepository) {
        self.coordinateRepository = _coordinateRepository
    }
    
    public func invoke() -> CoordinateEntity {
        return coordinateRepository.getCoordinate()
    }
}
