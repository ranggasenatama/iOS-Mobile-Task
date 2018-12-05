//
//  APIManager.swift
//  Data
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

public class APIManager {
    func makePredictImage(_username: String, _password: String, _image: String) {
        let parameters: [String: String] = [
            "idUser" : _username,
            "password" : _password,
            "image" : _image
        ]
        
        Alamofire.request("http://etc.if.its.ac.id/doPredict/", method: .post, parameters: parameters)
            .responseJSON { response in
                print(response)
        }
    }
}
