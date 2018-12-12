//
//  PredictRepository.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public protocol PredictRequestRepository {
    func makePredict(entity: PredictRequestEntity) -> Observable<SuperResponseEntity>
}
