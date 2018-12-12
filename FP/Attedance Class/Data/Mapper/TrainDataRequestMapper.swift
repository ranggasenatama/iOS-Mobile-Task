//
//  TrainDataRequestMapper.swift
//  Data
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain

public class TrainDataRequestMapper: MapperBase<TrainDataRequestEntity, TrainDataRequestData> {
    override init() {
        super.init()
    }
    
    public override func mapToEntity(model: TrainDataRequestData) -> TrainDataRequestEntity {
        return TrainDataRequestEntity(_user: UserEntity(_nrp: model.user.nrp, _password: model.user.password))
    }
    
    public override func mapToModel(entity: TrainDataRequestEntity) -> TrainDataRequestData {
        return TrainDataRequestData(_user: UserModelData(_nrp: entity.user.nrp, _password: entity.user.password))
    }
}
