//
//  PredictRepositoryData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public class PredictRequestRepositoryData: PredictRequestRepository {
    let apiManager = APIManager()
    let predictMapper: MapperBase<PredictRequestEntity, PredictRequestData> = PredictRequestMapper()
    
    public init(){
        
    }
    
    public func makePredict(entity: PredictRequestEntity) -> Observable<SuperResponseEntity>  {
        let request: PredictRequestData = predictMapper.mapToModel(entity: entity)

        return apiManager.makePredictImage(_username: request.user.nrp, _password: request.user.password, _image: request.image)
    }
}
