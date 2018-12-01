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
        guard let uiImage = UIImagePNGRepresentation(model.image) else { fatalError() }
        return ImageEntity(_image: uiImage)
    }
    
    public override func mapToModel(entity: ImageEntity) -> ImageDevice {
        guard let data = UIImage(data: entity.image) else { fatalError() }
        return ImageDevice(_image: data)
    }
}
