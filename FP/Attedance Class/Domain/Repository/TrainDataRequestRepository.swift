//
//  TrainDataRequestRepository.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public protocol TrainDataRequestRepository {
    func trainData(entity: TrainDataRequestEntity) -> Observable<SuperResponseEntity>
}
