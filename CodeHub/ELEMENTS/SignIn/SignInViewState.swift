//
//  SignInViewState.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 10.07.21.
//

import Foundation

public struct SignInViewState: Equatable {
    public internal(set) var emailInputEnabled = true
    public internal(set) var passwordInputEnabled = true
    public internal(set) var signInButtonEnabled = true
    public internal(set)
    var activityIndicatorAnimating = false
}
