//
//  LoginModel.swift
//  MVVM Login
//
//  Created by 2B on 07/05/2023.
//

import Foundation



struct LoginModel: Decodable {
    let status: Bool
    let message: String
    let data: UserData?
}

// MARK: - LoginModelData

struct UserData : Decodable {
    let id: Int
    let name, email, phone: String
    let image: String
    let points: Int
    let credit: Double
    let token: String
}

