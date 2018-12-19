//
//  TrainDataViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Domain
import Data
import RxSwift

class TrainDataViewModel {
    var user: UserModel!
    
    let trainDataUseCase: TrainDataUseCase = TrainDataUseCase(_trainDataRequestRepository: TrainDataRequestRepositoryData())
    
    func trainData() -> Observable<SuperResponseEntity> {
        return self.trainDataUseCase.invoke(_entity: TrainDataRequestEntity(_user: UserEntity(_nrp: user.nrp, _password: user.password)))
    }
}
