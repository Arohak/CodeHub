//
//  KeyboardObserverEventResponder.swift
//  Elements
//
//  Created by Ara Hakobyan on 4/14/20.
//  Copyright © 2020 Ara Hakobyan. All rights reserved.
//

import Foundation

protocol KeyboardObserverEventResponder: AnyObject {
    func keyboardWillShow(_ userInfo: KeyboardUserInfo)
    func keyboardDidShow(_ userInfo: KeyboardUserInfo) 
    func keyboardWillHide(_ userInfo: KeyboardUserInfo)
    func keyboardDidHide(_ userInfo: KeyboardUserInfo)
    func keyboardWillChangeFrame(_ userInfo: KeyboardUserInfo)
    func keyboardDidChangeFrame(_ userInfo: KeyboardUserInfo)
}

extension KeyboardObserverEventResponder {
    func keyboardWillShow(_ userInfo: KeyboardUserInfo) {
        // This default implementation allows this protocol method to be optional.
    }
    
    func keyboardDidShow(_ userInfo: KeyboardUserInfo) {
        // This default implementation allows this protocol method to be optional.
    }
    
    func keyboardWillHide(_ userInfo: KeyboardUserInfo) {
        // This default implementation allows this protocol method to be optional.
    }
    
    func keyboardDidHide(_ userInfo: KeyboardUserInfo) {
        // This default implementation allows this protocol method to be optional.
    }
    
    func keyboardWillChangeFrame(_ userInfo: KeyboardUserInfo) {
        // This default implementation allows this protocol method to be optional.
    }
    
    func keyboardDidChangeFrame(_ userInfo: KeyboardUserInfo) {
        // This default implementation allows this protocol method to be optional.
    }
}
