//
//  AbsentUserRequestRepositoryData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public class AbsentUserRequestRepositoryData: AbsentRequestRepository {
    let apiManager = APIManager()
    let absentUserMapper: MapperBase<AbsentRequestEntity, AbsentRequestData> = AbsentUserRequestMapper()
    
    public init(){
        
    }
    
    public func makeAbsent(entity: AbsentRequestEntity) -> Observable<SuperResponseEntity> {
        let request: AbsentRequestData = self.absentUserMapper.mapToModel(entity: entity)
        
        return apiManager.makeAbsentUser(_username: request.user.nrp, _password: request.user.password, _image: request.image, _lat: request.agenda.Lat, _lon: request.agenda.Lon, _agenda: request.agenda.idAgenda)
    }
}
