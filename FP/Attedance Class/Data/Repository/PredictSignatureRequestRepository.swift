//
//  PredictSignatureRequestRepository.swift
//  Data
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public class PredictSignatureRequestRepositoryData: PredictSignatureRequestRepository {
    let apiManager = APIManager()
    let predictMapper: MapperBase<PredictSignatureRequestEntity, PredictSignatureRequestData> = PredictSignatureRequestMapper()
    
    public init(){
        
    }
    
    public func makePredictSignature(entity: PredictSignatureRequestEntity) -> Observable<SuperResponseEntity> {
        let request: PredictSignatureRequestData = predictMapper.mapToModel(entity: entity)
        
        return apiManager.makePredictSignature(_username: request.user.nrp, _password: request.user.password, _image: request.image)
    }
}
