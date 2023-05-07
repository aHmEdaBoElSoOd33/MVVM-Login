//
//  LoginVC.swift
//  MVVM Login
//
//  Created by 2B on 07/05/2023.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    
    
    //MARK: - Varibles
    
    var viewModel = LoginViewModel()
    var userData : UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configeView()
    }
    //MARK: - Functions
    
    func configeView(){
        bindIndicatorWithViewModel()
        hideKeyboardWhenTappedAround()
        LoginApi.delegate = self
    }
    
    func loginUser(){
        guard let loginUser = viewModel.loginWithValidation(emailTxtField.text, passwordTxtField.text) else {
            return
        }
        showALert(message: loginUser)
        
    }
    
    func bindIndicatorWithViewModel(){
        viewModel.isLoading.bind { isLoading in
            guard let isLoading = isLoading else {return}
            if isLoading{
                self.activityIndicator.startAnimating()
            }else{
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    
    
    
    func bindViewModel(){
         
        viewModel.userData.bind { [weak self] userData in
            self?.userData = userData
        }
    }
    
    func openUserProfile(userData:UserData){
        
        let profileViewModelData = ProfileViewModel(userData: userData)
        let profileViewController = ProfileVC(profileViewModelData)
        
        present(profileViewController, animated: true)
        
    }
    
    
    
    
    //MARK: - IBActions
    @IBAction func loginBtn(_ sender: Any) {
        loginUser()
    }
    
}


extension LoginVC : LoginApiDelegate{
    func loginIsDone(_ message: String) {
        //showALert(message: message)
        bindViewModel()
        openUserProfile(userData: userData!)
    }
    
    func loginIsFail(_ message: String) {
        showALert(message: message)
        activityIndicator.stopAnimating()
    }
    
}
