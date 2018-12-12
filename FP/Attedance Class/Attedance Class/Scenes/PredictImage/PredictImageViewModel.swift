//
//  ViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 27/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import Domain
import Data
import RxSwift

class PredictImageViewModel {
    var user: UserModel!
    var image: UIImage!
    var agenda: AgendaModel!
    
    let getAbsentUserUseCase: GetAbsentUserUseCase = GetAbsentUserUseCase(_absentUserRepository: AbsentUserRequestRepositoryData())
    
    func makeAbsentUser() -> Observable<SuperResponseEntity> {
        let resize = self.image.renderResizedImage(newWidth: 96)
        
        guard let data = UIImageJPEGRepresentation(resize, 0.5) else {
            fatalError("error convert UIImage to data")
        }
        
        return self.getAbsentUserUseCase.invoke(_entity: AbsentRequestEntity(_user: UserEntity(_nrp: self.user.nrp, _password: self.user.password), _image: ImageEntity(_image: data), _agenda: AgendaEntity(_lat: self.agenda.Lat, _lon: self.agenda.Lon, _idAgenda: self.agenda.idAgenda)))
    }
}
