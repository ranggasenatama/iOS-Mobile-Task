//
//  PredictRepositoryData.swift
//  Data
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain

public class PredictRepositoryData: PredictRepository {
    let apiManager = APIManager()
    
    public func makePredict(entity: PredictEntity) {
        let data = entity.image
        let imageBase64 = data.base64EncodedString()
        let predictData = PredictData(_nrp: entity.username, _password: entity.password, _image: imageBase64)
        
        apiManager.makePredictImage(_username: predictData.nrp, _password: predictData.password, _image: predictData.image)
    }
}
