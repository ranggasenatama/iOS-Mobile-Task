//
//  CoordinateMapper.swift
//  Device
//
//  Created by Rangga Senatama Putra on 27/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain

public class CoordinateMapper: MapperBase<CoordinateEntity, CoordinateDevice> {
    override init() {
        super.init()
    }
    
    public override func mapToEntity(model: CoordinateDevice) -> CoordinateEntity {
        return CoordinateEntity(_longtitude: model.longitude, _latitude: model.latitude)
    }
    
    public override func mapToModel(entity: CoordinateEntity) -> CoordinateDevice {
        return CoordinateDevice(_longitude: entity.longtitude, _latitude: entity.latitude)
    }
}
