//
//  SendImageUserUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public class SendImageUserUseCase {
    public var sendImageRepository: SendImageRequestRepository
    
    public init(_sendImageRepository: SendImageRequestRepository) {
        self.sendImageRepository = _sendImageRepository
    }
    
    public func invoke(_entity: SendImageRequestEntity) -> Observable<SuperResponseEntity> {
        return self.sendImageRepository.sendImage(entity: _entity)
    }
}
