//
//  ProfileViewModel.swift
//  MVVM Login
//
//  Created by 2B on 07/05/2023.
//

import Foundation


class ProfileViewModel{
    
    var userData : UserData
    var userProfileImage : String
    var userName : String
    var userEmail : String
    var userPhone : String
    
    init(userData: UserData) {
        self.userData = userData
        self.userEmail = userData.email
        self.userProfileImage = userData.image
        self.userPhone = userData.phone
        self.userName = userData.name
    }
}
