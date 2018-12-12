//
//  PredictRequestMapper.swift
//  Data
//
//  Created by Rangga Senatama Putra on 02/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain

public class PredictRequestMapper: MapperBase<PredictRequestEntity, PredictRequestData> {
    override init() {
        super.init()
    }
    
    public override func mapToEntity(model: PredictRequestData) -> PredictRequestEntity {
        guard let imageData = Data(base64Encoded: model.image, options: .ignoreUnknownCharacters) else {
            fatalError("cant convert base64 to data")
        }

        return PredictRequestEntity(_user: UserEntity(_nrp: model.user.nrp, _password: model.user.password), _image: ImageEntity(_image: imageData))
    }
    
    public override func mapToModel(entity: PredictRequestEntity) -> PredictRequestData {
        let imageBase64 = "data:image/jpeg;base64,\(entity.image.image.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters))"
        
        return PredictRequestData(_user: UserModelData(_nrp: entity.user.nrp, _password: entity.user.password), _image: imageBase64)
    }
}
