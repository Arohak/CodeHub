//
//  SignInUserInterface.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 10.07.21.
//

import UIKit

typealias SignInUserInterfaceView = SignInUserInterface & UIView

protocol SignInUserInterface {
    func render(newState: SignInViewState)
    func moveContentForDismissedKeyboard()
    func moveContent(forKeyboardFrame keyboardFrame: CGRect)
}
