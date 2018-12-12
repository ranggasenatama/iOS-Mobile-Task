//
//  GetAbsentUserUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public class GetAbsentUserUseCase {
    public var absentUserRepository: AbsentRequestRepository
    
    public init(_absentUserRepository: AbsentRequestRepository) {
        self.absentUserRepository = _absentUserRepository
    }
    
    public func invoke(_entity: AbsentRequestEntity) -> Observable<SuperResponseEntity> {
        return absentUserRepository.makeAbsent(entity: _entity)
    }
}
