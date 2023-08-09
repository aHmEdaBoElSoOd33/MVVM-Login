//
//  LoginViewModel.swift
//  MVVM Login
//
//  Created by 2B on 07/05/2023.
//

import Foundation

class LoginViewModel {
    var isLoading : Observable<Bool> = Observable(false)
    var userData : Observable<UserData> = Observable(nil)
    var dataSource : UserData?
    var loginApi = LoginApi()
    var validationState : String?
    
    func loginUser(_ email:String , _ password:String){
        isLoading.value = true
        loginApi.loginUser(completion: { [weak self] data in
            guard let self = self else {return}
            self.isLoading.value = false
            switch data {
            case .success(let data):
                self.dataSource = data
                self.userData.value =  self.dataSource
            case .failure(let error):
                print(error)
            }
        }, email, password)
    }
    
    func validate(_ email : String? , _ password : String?){
        
        validationState = nil
        
        guard let email = email, !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            validationState = "please enter Email"
            return
        }
        guard let password = password, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            validationState = "please enter Password"
            return
        }
        loginUser(email, password)
    }
    
    func loginWithValidation(_ email : String? , _ password : String?)->String?{
        validate(email, password)
        guard let emptyField = validationState else {return nil}
        return emptyField
    }
}
