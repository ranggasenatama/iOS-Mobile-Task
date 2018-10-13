//
//  PostItemViewModel.swift
//  Mobile App
//
//  Created by Rangga Senatama Putra on 11/10/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain

final class PostItemViewModel   {
    let title:String
    let image: Photo
    let time: String
    let post: Post
    
    public init (with post: Post) {
        self.post = post
        self.title = post.title
        self.image = post.image
        self.time = post.time
    }
}
