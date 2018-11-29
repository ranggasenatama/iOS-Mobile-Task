//
//  ImageRepositoryDevice.swift
//  Device
//
//  Created by Rangga Senatama Putra on 29/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain

public class ImageRepositoryDevice: ImageRepository {
    let camera: CameraUtils = CameraUtils()
    let imageMapper: MapperBase<ImageEntity, ImageDevice> = ImageMapper()
    var imageOutput: UIImage!
    
    public init() {
        
    }
    
    public func getImage(vc: UIViewController) -> UIImage {
        camera.showActionSheet(vc: vc)
        camera.imagePickedBlock = { (image) in
            self.imageOutput = image
        }
        while self.imageOutput == nil {
            
        }
        return imageOutput
    }
}
