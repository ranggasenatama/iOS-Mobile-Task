//
//  GetPredictImageUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class GetPredictImageUseCase {
    public var predictRepository: PredictRepository
    
    public init(_predictRepository: PredictRepository) {
        self.predictRepository = _predictRepository
    }
    
    public func invoke(_entity: PredictEntity) {
        predictRepository.makePredict(entity: _entity)
    }
}
