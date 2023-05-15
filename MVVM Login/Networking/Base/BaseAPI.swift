//
//  BaseAPI.swift
//  MVVM Login
//
//  Created by 2B on 14/05/2023.
//

import Foundation
import Alamofire

enum NetworkError : Error{
    case not200
    case urlError
    case canNotParseData
}

class BaseAPI<T:TargetType>{
    
    func fetchData<M:Decodable>(target:T,responseClass:M.Type,completion:@escaping(Result<M?,NetworkError>)->Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let header = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.params)
        
        AF.request(target.basURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: header).responseDecodable(of:M.self){ response in
            guard let statusCode = response.response?.statusCode else {
                completion(.failure(.not200))
                return
            }
            if statusCode == 200 {
                switch response.result{
                case .success(let data):
                    completion(.success(data))
                    dump(data)
                case .failure(_):
                    completion(.failure(.canNotParseData))
                }
            }else if (400...499).contains(statusCode){
                completion(.failure(.urlError))
            }else{
                completion(.failure(.not200))
            }
        }
    }
    
    private func buildParams(task:Task)->([String:Any],ParameterEncoding){
        switch task{
        case .requestPlain:
            return ([:] , URLEncoding.default)
        case .requestParameters(parameter: let parameter, encoding: let encoding):
            return (parameter,encoding)
        }
    }
}
