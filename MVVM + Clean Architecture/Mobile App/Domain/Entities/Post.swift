//
//  Post.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 11/10/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public struct Post {
    let title: String
    let image: Photo
    let time: String
    
    public init(title: String, image: Photo, time: String) {
        self.title = title
        self.image = image
        self.time = time
    }
}
