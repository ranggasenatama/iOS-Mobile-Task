//
//  SendSignatureRequestRepositoryData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public class SendSignatureRequestRepositoryData: SendSignatureRequestRepository {
    let apiManager = APIManager()
    let sendSignatureMapper: MapperBase<SendSignatureRequestEntity, SendSignatureRequestData> = SendSignatureRequestMapper()
    
    public init(){
        
    }
    
    public func sendSignature(entity: SendSignatureRequestEntity) -> Observable<SuperResponseEntity> {
        let request: SendSignatureRequestData = self.sendSignatureMapper.mapToModel(entity: entity)
        
        return apiManager.sendSignatureUser(_username: request.user.nrp, _password: request.user.password, _image: request.image)
        
    }
}
