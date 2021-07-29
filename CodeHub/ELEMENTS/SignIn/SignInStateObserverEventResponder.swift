//
//  SignInStateObserverEventResponder.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 11.07.21.
//

import Foundation

protocol SignInStateObserverEventResponder: AnyObject {
    func received(newErrorMessage errorMessage: String)
    func received(newViewState viewState: SignInViewState)
}
