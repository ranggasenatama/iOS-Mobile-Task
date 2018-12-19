//
//  SendSignatureDataViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit
import Domain
import Data
import RxSwift

public class SendSignatureDataViewModel {
    var user: UserModel = UserModel(_nrp: "5115100076", _password: "123456")
    var signature: UIImage!
    
    let sendSignatureUseCase: SendSignatureUseCase = SendSignatureUseCase(_sendSignatureRepository: SendSignatureRequestRepositoryData())
    
    init(_signature: UIImage) {
        self.signature = _signature
    }
    
    func sendSignature() -> Observable<SuperResponseEntity> {
        let resize = self.signature.renderResizedImage(newWidth: 96)
        
        guard let data = UIImageJPEGRepresentation(resize, 0.5) else {
            fatalError("error convert UIImage to data")
        }
        
        return self.sendSignatureUseCase.invoke(_entity: SendSignatureRequestEntity(_user: UserEntity(_nrp: user.nrp, _password: user.password), _image: ImageEntity(_image: data)))
    }
}
