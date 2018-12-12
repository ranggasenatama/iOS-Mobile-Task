//
//  SendImageRepositoryData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public class SendImageRequestRepositoryData: SendImageRequestRepository {
    let apiManager = APIManager()
    let sendImageMapper: MapperBase<SendImageRequestEntity, SendImageRequestData> = SendImageRequestMapper()
    
    public init(){
        
    }
    
    public func sendImage(entity: SendImageRequestEntity) -> Observable<SuperResponseEntity> {
        let request: SendImageRequestData = self.sendImageMapper.mapToModel(entity: entity)
        
        return apiManager.sendImageUser(_username: request.user.nrp, _password: request.user.password, _image: request.image)
    }
}
