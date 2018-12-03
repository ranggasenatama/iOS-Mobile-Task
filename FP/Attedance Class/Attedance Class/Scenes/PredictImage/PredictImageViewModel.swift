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

class PredictImageViewModel {
    var nrp: String!
    var password: String!
    var image: UIImage!
    
    let predictRequest: PredictRequestRepository = PredictRequestRepositoryData()
    
    func makePredict() {
        guard let data = UIImageJPEGRepresentation(self.image, 0.1) else {
            fatalError("error convert UIImage to data")
        }
        print(data)
        predictRequest.makePredict(entity: PredictRequestEntity(_user: UserEntity(_nrp: self.nrp, _password: self.password), _image: ImageEntity(_image: data)))
    }
}
