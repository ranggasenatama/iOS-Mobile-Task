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

public class SuperResponseMapper: MapperBase<SuperResponseEntity, JSON> {
    override init() {
        super.init()
    }
    
    public override func mapToEntity(model: JSON) -> SuperResponseEntity {
        return SuperResponseEntity(_statusCode: 200, _message: model["msg"].string!)
    }
    
    public override func mapToModel(entity: SuperResponseEntity) -> JSON {
        return JSON()
    }
}
