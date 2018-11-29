//
//  ImageRepository.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 29/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

public protocol ImageRepository {
    func getImage(vc: UIViewController) -> UIImage
}
