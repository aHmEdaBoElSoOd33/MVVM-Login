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


class LoginApi{
    
    static var delegate : LoginApiDelegate?
    
    func loginUser(completion:@escaping (UserData) -> Void ,  _ email: String , _ password : String){
        
        let LoginUrl = Constants.shared.BaseURL+Constants.shared.loginEndPoint
        let params = ["email":email , "password":password]
        let headers = HTTPHeaders(["lang" : "en"])
        
        AF.request(LoginUrl, method: .post, parameters: params, encoder: .json, headers: headers).responseDecodable(of: LoginModel.self){ res in
            
            if res.response?.statusCode == 200{
                
                switch res.result{
                case .success(let user):
                    UserDefaults.standard.set(user.data.token, forKey: "token")
                    completion(user.data)
                    LoginApi.delegate?.loginIsDone(user.message)
                    
                    print(user.data.token)
                case .failure(let fail):
                    LoginApi.delegate?.loginIsFail(fail.localizedDescription)
                    print(fail.localizedDescription)
                }
            }else{
                print("Not 200")
            }
        }
    }
    
}
