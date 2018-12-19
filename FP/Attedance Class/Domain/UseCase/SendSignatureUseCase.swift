//
//  SendSignatureUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public class SendSignatureUseCase {
    public var sendSignatureRepository: SendSignatureRequestRepository
    
    public init(_sendSignatureRepository: SendSignatureRequestRepository) {
        self.sendSignatureRepository = _sendSignatureRepository
    }
    
    public func invoke(_entity: SendSignatureRequestEntity) -> Observable<SuperResponseEntity> {
        return self.sendSignatureRepository.sendSignature(entity: _entity)
    }
}
