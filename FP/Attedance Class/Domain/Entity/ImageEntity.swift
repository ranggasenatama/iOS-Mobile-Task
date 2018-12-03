//
//  ImageEntity.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 02/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public class ImageEntity {
    public let image: Data
    
    public init(_image: Data) {
        self.image = _image
    }
}
