//
//  TargetType.swift
//  MVVM Login
//
//  Created by 2B on 14/05/2023.
//

import Foundation
import Alamofire

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    case requestPlain
    case requestParameters(parameter:[String:Any], encoding: ParameterEncoding)
}

protocol TargetType{
    var basURL : String {get}
    var path : String {get}
    var method : HTTPMethod {get}
    var params : Task {get}
    var headers : [String:String]? {get}
}



