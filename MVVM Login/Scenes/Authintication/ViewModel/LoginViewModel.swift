//
//  LoginViewModel.swift
//  MVVM Login
//
//  Created by 2B on 07/05/2023.
//

import Foundation
import UIKit

class LoginViewModel : UIViewController{
    var isLoading : Observable<Bool> = Observable(false)
    var userData : Observable<UserData> = Observable(nil)
    var dataSource : UserData?
    var loginApi = LoginApi()
    var validationState : String?
   
    
    func loginUser(_ email:String , _ password:String){
        isLoading.value = true
        loginApi.loginUser(completion: { [weak self] data in
            self?.isLoading.value = false
            self?.dataSource = data
            self?.userData.value =  self?.dataSource
        }, email, password)
        
    }
    
    
    func validate(_ email : String? , _ password : String?){
        
        validationState = nil
        
        guard let email = email, !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            //showALert(message: "please enter Email")
            validationState = "please enter Email"
            return
        }
        guard let password = password, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            //print("pass")
            //showALert(message: "please enter Password")
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
