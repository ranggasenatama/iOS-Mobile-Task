//
//  PredictRepository.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public protocol PredictRepository {
    func makePredict(entity: PredictEntity)
}
