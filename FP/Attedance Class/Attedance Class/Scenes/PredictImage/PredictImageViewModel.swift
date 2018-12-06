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
    var nrp: String!
    var password: String!
    var image: UIImage!
    var lat: String!
    var lon: String!
    var agenda: String!
    
    let getPredictImageUseCase: GetPredictImageUseCase = GetPredictImageUseCase(_predictRepository: PredictRequestRepositoryData())
    
    func makePredict() -> Observable<PredictResponseEntity> {
        let resize = self.image.renderResizedImage(newWidth: 96)
        //let compressImage = resize.compressTo(1)
        guard let data = UIImageJPEGRepresentation(resize, 0.5) else {
            fatalError("error convert UIImage to data")
        }
        print(data)
        
        return self.getPredictImageUseCase.invoke(_entity: PredictRequestEntity(_user: UserEntity(_nrp: self.nrp, _password: self.password), _image: ImageEntity(_image: data), _agenda: AgendaEntity(_lat: self.lat, _lon: self.lon, _idAgenda: self.agenda)))
    }
}
