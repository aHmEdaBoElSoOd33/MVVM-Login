//
//  Extension.swift
//  MVVM Login
//
//  Created by 2B on 07/05/2023.
//

import Foundation
import UIKit

extension UIViewController{
    
    func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showALert(message:String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.modalTransitionStyle = .coverVertical
         self.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 ){
            alert.dismiss(animated: true)
        }
    }
}
