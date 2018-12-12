//
//  GetPredictImageViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import Domain
import Data
import RxSwift

class GetPredictImageViewModel {
    var user: UserModel!
    var image: UIImage!
    var agenda: AgendaModel!
    
    let getPredictImageUseCase: GetPredictImageUseCase = GetPredictImageUseCase(_predictRepository: PredictRequestRepositoryData())
    
    func makePredict() -> Observable<SuperResponseEntity> {
        let resize = self.image.renderResizedImage(newWidth: 96)
        
        guard let data = UIImageJPEGRepresentation(resize, 0.5) else {
            fatalError("error convert UIImage to data")
        }
        
        return self.getPredictImageUseCase.invoke(_entity: PredictRequestEntity(_user: UserEntity(_nrp: self.user.nrp, _password: self.user.password), _image: ImageEntity(_image: data)))
    }
}
