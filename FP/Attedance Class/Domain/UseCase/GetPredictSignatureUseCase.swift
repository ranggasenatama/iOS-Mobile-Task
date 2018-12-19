//
//  GetPredictSignatureUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public class GetPredictSignatureUseCase {
    public var predictRepository: PredictSignatureRequestRepository
    
    public init(_predictRepository: PredictSignatureRequestRepository) {
        self.predictRepository = _predictRepository
    }
    
    public func invoke(_entity: PredictSignatureRequestEntity) -> Observable<SuperResponseEntity> {
        return predictRepository.makePredictSignature(entity: _entity)
    }
}
