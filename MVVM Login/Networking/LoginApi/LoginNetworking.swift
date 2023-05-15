//
//  LoginNetworking.swift
//  MVVM Login
//
//  Created by 2B on 14/05/2023.
//

import Foundation
import Alamofire

enum LoginNetworking {
    case loginUser(email: String , password:String)
}

extension LoginNetworking : TargetType{
    var basURL: String {
        switch self{
        case .loginUser:
            return Constants.BaseURL
        }
    }
    var path: String {
        switch self{
        case .loginUser:
            return Constants.loginEndPoint
        }
    }
    var method: HTTPMethod {
        switch self{
        case .loginUser:
            return .post
        }
    }
    var params: Task {
        switch self{
        case .loginUser(let email,let password):
            return .requestParameters(parameter: ["email":email , "password":password], encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        switch self {
        default:
            return ["lang" : "en"]
        }
    }
}
