//
//  GetSignatureAbsentUseCase.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 20/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public class GetSignatureAbsentUserUseCase {
    public var signatureAbsentRepository: SignatureAbsentRequestRepository
    
    public init(_signatureAbsentRepository: SignatureAbsentRequestRepository) {
        self.signatureAbsentRepository = _signatureAbsentRepository
    }
    
    public func invoke(_entity: SignatureAbsentRequestEntity) -> Observable<SuperResponseEntity> {
        return signatureAbsentRepository.makeSignatureAbsent(entity: _entity)
    }
}
