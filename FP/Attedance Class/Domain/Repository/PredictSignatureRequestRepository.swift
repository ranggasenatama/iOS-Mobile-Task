//
//  PredictSignatureRequestRepository.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public protocol PredictSignatureRequestRepository {
    func makePredictSignature(entity: PredictSignatureRequestEntity) -> Observable<SuperResponseEntity>
}
