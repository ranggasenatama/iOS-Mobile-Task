//
//  SendSignatureRequestRepository.swift
//  Domain
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import RxSwift

public protocol SendSignatureRequestRepository {
    func sendSignature(entity: SendSignatureRequestEntity) -> Observable<SuperResponseEntity>
}
