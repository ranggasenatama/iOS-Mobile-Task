//
//  SendImageDataViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 12/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Domain
import Data

class SendImageDataViewModel {
    var user: UserModel!
    var image: UIImage!
    
    let sendImageUserUseCase: SendImageUserUseCase = SendImageUserUseCase(_sendImageRepository: SendImageRequestRepositoryData())
    
    func sendImage() -> Observable<SuperResponseEntity> {
        let resize = self.image.renderResizedImage(newWidth: 96)
        
        guard let data = UIImageJPEGRepresentation(resize, 0.5) else {
            fatalError("error convert UIImage to data")
        }
        
        return self.sendImageUserUseCase.invoke(_entity: SendImageRequestEntity(_user: UserEntity(_nrp: user.nrp, _password: user.password), _image: ImageEntity(_image: data)))
    }
}
