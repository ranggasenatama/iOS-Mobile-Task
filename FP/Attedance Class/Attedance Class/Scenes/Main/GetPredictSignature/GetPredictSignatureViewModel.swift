//
//  GetPredictSignatureViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import Domain
import Data
import RxSwift

class GetPredictSignatureViewModel {
    var user: UserModel!
    var image: UIImage!
    
    init(_user: UserModel, _image: UIImage) {
        self.user = _user
        self.image = _image
    }
    
//    func makePredictSignature() -> Observable<SuperResponseEntity> {
//        let resize = self.image.renderResizedImage(newWidth: 96)
//        
//        guard let data = UIImageJPEGRepresentation(resize, 0.5) else {
//            fatalError("error convert UIImage to data")
//        }
//        
//        return self.getPredictImageUseCase.invoke(_entity: PredictRequestEntity(_user: UserEntity(_nrp: self.user.nrp, _password: self.user.password), _image: ImageEntity(_image: data)))
//    }
}
