//
//  TrainDataUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public class TrainDataUseCase {
    public var trainDataRequestRepository: TrainDataRequestRepository
    
    public init(_trainDataRequestRepository: TrainDataRequestRepository) {
        self.trainDataRequestRepository = _trainDataRequestRepository
    }
    
    public func invoke(_entity: TrainDataRequestEntity) -> Observable<SuperResponseEntity> {
        return trainDataRequestRepository.trainData(entity: _entity)
    }
}
