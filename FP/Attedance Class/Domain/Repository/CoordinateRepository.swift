//
//  CoordinateRepository.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 26/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public protocol CoordinateRepository {
    func getCoordinate() -> CoordinateEntity
    func calculateDistance(coordinate1: CoordinateEntity, coordinate2: CoordinateEntity) -> Double
}
