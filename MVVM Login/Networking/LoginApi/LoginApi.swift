//
//  LoginApi.swift
//  MVVM Login
//
//  Created by 2B on 07/05/2023.
//

import Foundation
import Alamofire

protocol LoginApiDelegate {
    func loginIsDone(_ message:String)
    func loginIsFail(_ message :String)
}

class LoginApi : BaseAPI<LoginNetworking>{
    
    static var delegate : LoginApiDelegate?
    
    func loginUser(completion:@escaping (Result<UserData,NetworkError>) -> Void ,  _ email: String , _ password : String){
        self.fetchData(target: .loginUser(email: email, password: password), responseClass: LoginModel.self) { response in
            switch response{
            case .success(let alldata):
                if let userData = alldata?.data{
                    completion(.success(userData))
                    LoginApi.delegate?.loginIsDone(alldata!.message)
                }else{
                    LoginApi.delegate?.loginIsDone(alldata!.message)
                }
            case .failure(let error):
                completion(.failure(error))
                LoginApi.delegate?.loginIsFail(error.localizedDescription)
            }
        }
    }
}
