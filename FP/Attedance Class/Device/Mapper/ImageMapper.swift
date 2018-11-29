//
//  ImageMapper.swift
//  Device
//
//  Created by Rangga Senatama Putra on 29/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain

public class ImageMapper: MapperBase<ImageEntity, ImageDevice> {
    override init() {
        super.init()
    }
    
    public override func mapToEntity(model: ImageDevice) -> ImageEntity {
        return ImageEntity(_image: model.image)
    }
    
    public override func mapToModel(entity: ImageEntity) -> ImageDevice {
        return ImageDevice(_image: entity.image)
    }
}
