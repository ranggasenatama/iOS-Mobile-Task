//
//  GetPredictImageUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class GetPredictImageUseCase {
    public var predictRepository: PredictRequestRepository
    
    public init(_predictRepository: PredictRequestRepository) {
        self.predictRepository = _predictRepository
    }
    
    public func invoke(_entity: PredictRequestEntity) {
        predictRepository.makePredict(entity: _entity)
    }
}
