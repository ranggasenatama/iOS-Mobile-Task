//
//  GetPredictImageUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public class GetPredictImageUseCase {
    public var predictRepository: PredictRequestRepository
    
    public init(_predictRepository: PredictRequestRepository) {
        self.predictRepository = _predictRepository
    }
    
    public func invoke(_entity: PredictRequestEntity) -> Observable<PredictResponseEntity> {
        return predictRepository.makePredict(entity: _entity)
    }
}
