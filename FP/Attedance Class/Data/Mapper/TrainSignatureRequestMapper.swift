//
//  TrainSignatureRequestMapper.swift
//  Data
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain

public class TrainSignatureRequestMapper: MapperBase<TrainSignatureRequestEntity, TrainSignatureRequestData> {
    override init() {
        super.init()
    }
    
    public override func mapToEntity(model: TrainSignatureRequestData) -> TrainSignatureRequestEntity {
        return TrainSignatureRequestEntity(_user: UserEntity(_nrp: model.user.nrp, _password: model.user.password))
    }
    
    public override func mapToModel(entity: TrainSignatureRequestEntity) -> TrainSignatureRequestData {
        return TrainSignatureRequestData(_user: UserModelData(_nrp: entity.user.nrp, _password: entity.user.password))
    }
}
