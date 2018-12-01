//
//  AttedanceAPI.swift
//  Data
//
//  Created by Rangga Senatama Putra on 01/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Moya

enum AttendanceAPI {
    case doTrain(idUser: String, password: String, image: String)
}

// MARK: - TargetType Protocol Implementation
extension AttendanceAPI: TargetType {
    var baseURL: URL { return URL(string: "http://etc.if.its.ac.id")! }
    
    var path: String {
        switch self {
        case .doTrain(_, _, _):
            return "/doTrain/"
        }
    }
    var method: Moya.Method {
        switch self {
        case .doTrain:
            return .post
        }
    }
    var task: Task {
        switch self {
        case let .doTrain(idUser, password, image):
            return .requestParameters(parameters: ["idUser": idUser, "password": password, "image": image], encoding: URLEncoding.queryString)
        }
    }
    var sampleData: Data {
        switch self {
        case .doTrain(let idUser, _, _):
            return "\(idUser) Successs".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
