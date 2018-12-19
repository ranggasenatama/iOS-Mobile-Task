//
//  TrainSignatureViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Domain
import Data
import RxSwift

class TrainSignatureViewModel {
    var user: UserModel!
    
    let trainSignatureUseCase: TrainSignatureUseCase = TrainSignatureUseCase(_trainSignatureRequestRepository: TrainSignatureRequestRepositoryData())
    
    init(_user: UserModel) {
        self.user = _user
    }
    
    func trainSignature() -> Observable<SuperResponseEntity> {
        return self.trainSignatureUseCase.invoke(_entity: TrainSignatureRequestEntity(_user: UserEntity(_nrp: user.nrp, _password: user.password)))
    }
}
