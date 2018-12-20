//
//  MakeSignatureAbsentRequestRepository.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 20/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public protocol SignatureAbsentRequestRepository {
    func makeSignatureAbsent(entity: SignatureAbsentRequestEntity) -> Observable<SuperResponseEntity>
}
