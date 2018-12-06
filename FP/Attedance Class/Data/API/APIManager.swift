//
//  APIManager.swift
//  Data
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Domain
import SwiftyJSON
import Alamofire
import RxSwift
import RxAlamofire

public class APIManager {
    
    let predictResponseMapper: MapperBase<PredictResponseEntity, JSON> = PredictResponseMapper()
    
    func makePredictImage(_username: String, _password: String, _image: String) -> Observable<PredictResponseEntity> {
        
        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password,
            "image" : _image
        ]
        
        let url = "http://etc.if.its.ac.id/doPredict/"
        
//        Alamofire.request(url, method: .post, parameters: parameters)
//            .responseJSON { response in
//                print(response)
//        }
        
        return Observable<PredictResponseEntity>.create { (observer) -> Disposable in
            let requestReference = Alamofire.request(url,
                                                     method: .post,
                                                     parameters: parameters)
                .validate()
                .responseJSON { (response) in
                    switch response.result{
                    case .success:
                        if response.data != nil {
                            do {
                                let json = try JSON(data: response.data!)
                                
                                observer.onNext(self.predictResponseMapper.mapToEntity(model: json))
                                observer.onCompleted()
                            } catch {
                                print("error")
                            }
                            
                        }
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create(with: {
                requestReference.cancel()
            })
        }
    }
}
