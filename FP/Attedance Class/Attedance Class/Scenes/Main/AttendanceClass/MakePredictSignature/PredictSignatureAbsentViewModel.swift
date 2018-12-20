//
//  PredictSignatureAbsentViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 20/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import Domain
import Data
import RxSwift

class PredictSignatureAbsentViewModel {
    var user: UserModel!
    var image: UIImage!
    var agenda: AgendaModel!
    
    let getSignatureAbsentUseCase: GetSignatureAbsentUserUseCase = GetSignatureAbsentUserUseCase(_signatureAbsentRepository: SignatureAbsentRequestRepositoryData())
    
    func makeSignatureAbsent() -> Observable<SuperResponseEntity> {
        let resize = self.image.renderResizedImage(newWidth: 96)
        
        guard let data = UIImageJPEGRepresentation(resize, 0.5) else {
            fatalError("error convert UIImage to data")
        }
        
        return self.getSignatureAbsentUseCase.invoke(_entity: SignatureAbsentRequestEntity(_user: UserEntity(_nrp: self.user.nrp, _password: self.user.password), _image: ImageEntity(_image: data), _agenda: AgendaEntity(_lat: self.agenda.Lat, _lon: self.agenda.Lon, _idAgenda: self.agenda.idAgenda)))
    }
}
