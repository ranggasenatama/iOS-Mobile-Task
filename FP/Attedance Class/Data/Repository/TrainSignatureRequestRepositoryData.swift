//
//  TrainSignatureRequestRepositoryData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Domain
import RxSwift

public class TrainSignatureRequestRepositoryData: TrainSignatureRequestRepository {
    let apiManager = APIManager()
    let trainSignatureMapper: MapperBase<TrainSignatureRequestEntity, TrainSignatureRequestData> = TrainSignatureRequestMapper()
    
    public init(){
        
    }
    
    public func trainSignature(entity: TrainSignatureRequestEntity) -> Observable<SuperResponseEntity> {
        let request: TrainSignatureRequestData = self.trainSignatureMapper.mapToModel(entity: entity)
        
        return apiManager.trainSignature(_username: request.user.nrp, _password: request.user.password)
    }
}
