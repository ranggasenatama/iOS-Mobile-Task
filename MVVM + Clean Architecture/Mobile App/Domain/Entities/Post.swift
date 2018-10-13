//
//  Post.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 11/10/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public struct Post {
    public let title: String
    public let image: UIImage
    public let time: String
    
    public init(title: String, image: UIImage, time: String) {
        self.title = title
        self.image = image
        self.time = time
    }
}
