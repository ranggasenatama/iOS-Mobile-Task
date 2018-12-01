//
//  APIManager.swift
//  Data
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Moya

public class APIManager {
    let provider = MoyaProvider<AttendanceAPI>()

    func makePredictImage(_username: String, _password: String, _image: String) {
        provider.request(.doTrain(idUser: _username, password: _password, image: _image)) { result in
            switch result {
            case let .success(response):
                do {
                    try response.filterSuccessfulStatusCodes()
                    let data = try response.data
                    print(data)
                }
                catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
