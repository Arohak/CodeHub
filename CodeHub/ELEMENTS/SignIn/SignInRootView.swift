//
//  SignInRootView.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 10.07.21.
//

import UIKit

class SignInRootView: UIView {
    let scrollView = UIScrollView(frame: .zero)

    let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        return field
    }()
    
    let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        return field
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .orange
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)

    init() {
        super.init(frame: .zero)
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignInRootView {
    func buildUI() {
        addSubview(scrollView)
        addSubview(activityIndicator)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(signInButton)
        
        scrollView.anchors(
            top: .init(anchor: topAnchor),
            left: .init(anchor: leadingAnchor),
            right: .init(anchor: trailingAnchor),
            bottom: .init(anchor: bottomAnchor)
        )
        
        emailField.anchors(
            top: .init(anchor: scrollView.topAnchor, constant: 20),
            centerX: .init(anchor: centerXAnchor),
            height: 44,
            width: 200
        )
        
        passwordField.anchors(
            top: .init(anchor: emailField.topAnchor, constant: 20),
            centerX: .init(anchor: centerXAnchor),
            height: 44,
            width: 200
        )
        
        signInButton.anchors(
            top: .init(anchor: passwordField.topAnchor, constant: 20),
            centerX: .init(anchor: centerXAnchor),
            height: 44,
            width: 100
        )
        
        activityIndicator.anchors(
            centerX: .init(anchor: centerXAnchor),
            centerY: .init(anchor: centerYAnchor)
        )
    }
}

extension SignInRootView: SignInUserInterface {
    func render(newState: SignInViewState) {
        emailField.isEnabled    = newState.emailInputEnabled
        passwordField.isEnabled = newState.passwordInputEnabled
        signInButton.isEnabled  = newState.signInButtonEnabled
        
        newState.activityIndicatorAnimating ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    func moveContentForDismissedKeyboard() {
        
    }
    
    func moveContent(forKeyboardFrame keyboardFrame: CGRect) {
        var insets = scrollView.contentInset
        insets.bottom = keyboardFrame.height
        scrollView.contentInset = insets
    }
}
