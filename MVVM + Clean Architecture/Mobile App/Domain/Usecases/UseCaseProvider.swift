//
//  UseCasesProvider.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 11/10/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public protocol UseCaseProvider {
    func makePostsUseCase() -> PostsUseCase
}
