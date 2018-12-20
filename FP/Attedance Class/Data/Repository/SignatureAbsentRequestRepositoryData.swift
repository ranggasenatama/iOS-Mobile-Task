//
//  SignatureRequestRepositoryData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 20/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public class SignatureAbsentRequestRepositoryData: SignatureAbsentRequestRepository {
    let apiManager = APIManager()
    let signatureAbsentUserMapper: MapperBase<SignatureAbsentRequestEntity, SignatureAbsentRequestData> = SignatureAbsentRequestMapper()
    
    public init(){
        
    }
    
    public func makeSignatureAbsent(entity: SignatureAbsentRequestEntity) -> Observable<SuperResponseEntity> {
        let request: SignatureAbsentRequestData = self.signatureAbsentUserMapper.mapToModel(entity: entity)
        
        return apiManager.makeSignatureAbsentUser(_username: request.user.nrp, _password: request.user.password, _image: request.image, _lat: request.agenda.Lat, _lon: request.agenda.Lon, _agenda: request.agenda.idAgenda)
    }
}
