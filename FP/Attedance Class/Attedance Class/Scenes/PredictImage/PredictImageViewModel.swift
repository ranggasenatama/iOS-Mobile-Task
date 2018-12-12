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
    
    let getPredictImageUseCase: GetPredictImageUseCase = GetPredictImageUseCase(_predictRepository: PredictRequestRepositoryData())
    
    func makePredict() -> Observable<PredictResponseEntity> {
        let resize = self.image.renderResizedImage(newWidth: 96)
        //let compressImage = resize.compressTo(1)
        guard let data = UIImageJPEGRepresentation(resize, 0.5) else {
            fatalError("error convert UIImage to data")
        }
        print(data)
        
        return self.getPredictImageUseCase.invoke(_entity: PredictRequestEntity(_user: UserEntity(_nrp: self.user.nrp, _password: self.user.password), _image: ImageEntity(_image: data), _agenda: AgendaEntity(_lat: self.agenda.Lat, _lon: self.agenda.Lon, _idAgenda: self.agenda.idAgenda)))
    }
}
