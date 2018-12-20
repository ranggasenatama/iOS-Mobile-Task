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
    let superResponseMapper: MapperBase<SuperResponseEntity, JSON> = SuperResponseMapper()
    
    func makePredictImage(_username: String, _password: String, _image: String) -> Observable<SuperResponseEntity> {
        
        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password,
            "image" : _image
        ]
        
        let url = "http://etc.if.its.ac.id/doPredict/"
        
        return Observable<SuperResponseEntity>.create { (observer) -> Disposable in
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
                                
                                observer.onNext(self.superResponseMapper.mapToEntity(model: json))
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
    
    func makeAbsentUser(_username: String, _password: String, _image: String, _lat: String, _lon: String, _agenda: String) -> Observable<SuperResponseEntity> {

        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password,
            "image" : _image,
            "Lat": _lat,
            "Lon": _lon,
            "idAgenda": _agenda
        ]

        let url = "http://etc.if.its.ac.id/signin/"

        return Observable<SuperResponseEntity>.create { (observer) -> Disposable in
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

                                observer.onNext(self.superResponseMapper.mapToEntity(model: json))
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
    
    func makeSignatureAbsentUser(_username: String, _password: String, _image: String, _lat: String, _lon: String, _agenda: String) -> Observable<SuperResponseEntity> {
        
        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password,
            "image" : _image,
            "Lat": _lat,
            "Lon": _lon,
            "idAgenda": _agenda
        ]
        
        let url = "http://etc.if.its.ac.id/signin_TTD/"
        
        return Observable<SuperResponseEntity>.create { (observer) -> Disposable in
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
                                
                                observer.onNext(self.superResponseMapper.mapToEntity(model: json))
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
    
    func sendImageUser(_username: String, _password: String, _image: String) -> Observable<SuperResponseEntity> {
        
        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password,
            "image" : _image
        ]
        
        let url = "http://etc.if.its.ac.id/sendImg/"
        
        return Observable<SuperResponseEntity>.create { (observer) -> Disposable in
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
                                
                                observer.onNext(self.superResponseMapper.mapToEntity(model: json))
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
    
    func trainData(_username: String, _password: String) -> Observable<SuperResponseEntity> {
        
        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password
        ]
        
        let url = "http://etc.if.its.ac.id/doTrain/"
        
        return Observable<SuperResponseEntity>.create { (observer) -> Disposable in
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
                                
                                observer.onNext(self.superResponseMapper.mapToEntity(model: json))
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
    
    func sendSignatureUser(_username: String, _password: String, _image: String) -> Observable<SuperResponseEntity> {
        
        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password,
            "image" : _image
        ]
        
        let url = "http://etc.if.its.ac.id/sendSignature/"
        
        return Observable<SuperResponseEntity>.create { (observer) -> Disposable in
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
                                
                                observer.onNext(self.superResponseMapper.mapToEntity(model: json))
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
    
    func trainSignature(_username: String, _password: String) -> Observable<SuperResponseEntity> {
        
        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password
        ]
        
        let url = "http://etc.if.its.ac.id/doTrain_TTD/"
        
        return Observable<SuperResponseEntity>.create { (observer) -> Disposable in
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
                                
                                observer.onNext(self.superResponseMapper.mapToEntity(model: json))
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
    
    func makePredictSignature(_username: String, _password: String, _image: String) -> Observable<SuperResponseEntity> {
        
        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password,
            "image" : _image
        ]
        
        let url = "http://etc.if.its.ac.id/doPredict_TTD/"
        
        return Observable<SuperResponseEntity>.create { (observer) -> Disposable in
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
                                
                                observer.onNext(self.superResponseMapper.mapToEntity(model: json))
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
