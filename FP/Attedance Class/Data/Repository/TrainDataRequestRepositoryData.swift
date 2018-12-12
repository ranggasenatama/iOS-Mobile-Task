//
//  TrainDataRequestRepositoryData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public class TrainDataRequestRepositoryData: TrainDataRequestRepository {
    let apiManager = APIManager()
    let trainDataMapper: MapperBase<TrainDataRequestEntity, TrainDataRequestData> = TrainDataRequestMapper()
    
    public init(){
        
    }
    
    public func trainData(entity: TrainDataRequestEntity) -> Observable<SuperResponseEntity> {
        let request: TrainDataRequestData = self.trainDataMapper.mapToModel(entity: entity)
        
        return apiManager.trainData(_username: request.user.nrp, _password: request.user.password)
    }
}
