//
//  SignatureAbsentRequestMapper.swift
//  Data
//
//  Created by Rangga Senatama Putra on 20/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain

public class SignatureAbsentRequestMapper: MapperBase<SignatureAbsentRequestEntity, SignatureAbsentRequestData> {
    override init() {
        super.init()
    }
    
    public override func mapToEntity(model: SignatureAbsentRequestData) -> SignatureAbsentRequestEntity {
        guard let imageData = Data(base64Encoded: model.image, options: .ignoreUnknownCharacters) else {
            fatalError("cant convert base64 to data")
        }
        
        return SignatureAbsentRequestEntity(_user: UserEntity(_nrp: model.user.nrp, _password: model.user.password), _image: ImageEntity(_image: imageData), _agenda: AgendaEntity(_lat: model.agenda.Lat, _lon: model.agenda.Lon, _idAgenda: model.agenda.idAgenda))
    }
    
    public override func mapToModel(entity: SignatureAbsentRequestEntity) -> SignatureAbsentRequestData {
        let imageBase64 = "data:image/jpeg;base64,\(entity.image.image.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters))"
        
        return SignatureAbsentRequestData(_user: UserModelData(_nrp: entity.user.nrp, _password: entity.user.password), _image: imageBase64, _agenda: AgendaModelData(_lat: entity.agenda.Lat, _lon: entity.agenda.Lon, _idAgenda: entity.agenda.idAgenda))
    }
}
