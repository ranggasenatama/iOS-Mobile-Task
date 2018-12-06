//
//  PredictResponseMapper.swift
//  Data
//
//  Created by Rangga Senatama Putra on 05/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import SwiftyJSON

public class PredictResponseMapper: MapperBase<PredictResponseEntity, JSON> {
    override init() {
        super.init()
    }
    
    public override func mapToEntity(model: JSON) -> PredictResponseEntity {
        return PredictResponseEntity(_statusCode: 200, _message: model["msg"].string!)
    }
    
    public override func mapToModel(entity: PredictResponseEntity) -> JSON {
        return JSON()
    }
}
