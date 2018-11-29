//
//  Mapper.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 26/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation

open class MapperBase<E,M> {
    public init() {
        
    }
    open func mapToEntity(model: M) -> E {
        preconditionFailure("This method must be overridden")
    }
    open func mapToModel(entity: E) -> M {
        preconditionFailure("This method must be overridden")
    }
}
