//
//  Observable.swift
//  MVVM Login
//
//  Created by 2B on 07/05/2023.
//

import Foundation


class Observable<T>{
    
    
    var value : T? {
        
        didSet{
            self.listener?(value)
        }
    }
    init(_ value: T? = nil) {
        self.value = value
    }
    
    
    var listener : ((T?)->Void)?
    
    
    func bind(_ listener:@escaping(T?)->Void){
        listener(value)
        self.listener = listener
    }
    
}
