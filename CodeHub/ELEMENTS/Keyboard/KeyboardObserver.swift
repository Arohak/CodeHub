//
//  KeyboardObserver.swift
//  Elements
//
//  Created by Ara Hakobyan on 4/14/20.
//  Copyright © 2020 Ara Hakobyan. All rights reserved.
//

import Foundation
import UIKit

class KeyboardObserver: Observer {
    
    // MARK: - Properties
    weak var eventResponder: KeyboardObserverEventResponder? {
        willSet {
            if eventResponder == nil {
                stopObserving()
            }
        }
    }
    
    private var isObserving = false
    
    // MARK: - Methods
    func startObserving() {
        if isObserving == true {
            return
        }
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardDidShow),
            name: UIResponder.keyboardDidShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardDidHide),
            name: UIResponder.keyboardDidHideNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillChangeFrame),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(keyboardDidChangeFrame),
            name: UIResponder.keyboardDidChangeFrameNotification,
            object: nil
        )
        
        isObserving = true
    }
    
    func stopObserving() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
        
        isObserving = false
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        assert(notification.name == UIResponder.keyboardWillShowNotification)

        guard let userInfo = KeyboardUserInfo(notification) else {
            assertionFailure()
            return
        }

        eventResponder?.keyboardWillShow(userInfo)
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        assert(notification.name == UIResponder.keyboardDidShowNotification)

        guard let userInfo = KeyboardUserInfo(notification) else {
            assertionFailure()
            return
        }

        eventResponder?.keyboardDidShow(userInfo)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        assert(notification.name == UIResponder.keyboardWillHideNotification)

        guard let userInfo = KeyboardUserInfo(notification) else {
            assertionFailure()
            return
        }
        // 3
        eventResponder?.keyboardWillHide(userInfo)
    }
    
    @objc func keyboardDidHide(notification: Notification) {
        assert(notification.name == UIResponder.keyboardDidHideNotification)

        guard let userInfo = KeyboardUserInfo(notification) else {
            assertionFailure()
            return
        }

        eventResponder?.keyboardDidHide(userInfo)
    }
    
    @objc func keyboardWillChangeFrame(notification: Notification) {
        assert(notification.name == UIResponder.keyboardWillChangeFrameNotification)

        guard let userInfo = KeyboardUserInfo(notification) else {
            assertionFailure()
            return
        }

        eventResponder?.keyboardWillChangeFrame(userInfo)
    }
    
    @objc func keyboardDidChangeFrame(notification: Notification) {
        assert(notification.name == UIResponder.keyboardDidChangeFrameNotification)

        guard let userInfo = KeyboardUserInfo(notification) else {
            assertionFailure()
            return
        }

        eventResponder?.keyboardDidChangeFrame(userInfo)
    }
}
