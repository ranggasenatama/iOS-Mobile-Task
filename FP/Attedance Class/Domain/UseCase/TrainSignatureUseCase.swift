//
//  TrainSignatureUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public class TrainSignatureUseCase {
    public var trainSignatureRequestRepository: TrainSignatureRequestRepository
    
    public init(_trainSignatureRequestRepository: TrainSignatureRequestRepository) {
        self.trainSignatureRequestRepository = _trainSignatureRequestRepository
    }
    
    public func invoke(_entity: TrainSignatureRequestEntity) -> Observable<SuperResponseEntity> {
        return self.trainSignatureRequestRepository.trainSignature(entity: _entity)
    }
}
