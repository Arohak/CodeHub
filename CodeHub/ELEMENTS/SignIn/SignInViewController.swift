//
//  SignInViewController.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 10.07.21.
//

import UIKit

class SignInViewController: UIViewController {
    let userInterface: SignInUserInterfaceView
    var observer: Observer?
    
    init(userInterface: SignInUserInterfaceView, observer: Observer?) {
        self.userInterface = userInterface
        self.observer = observer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = userInterface
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observer?.startObserving()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        observer?.stopObserving()
    }
}

extension SignInViewController: SignInStateObserverEventResponder {
    func received(newErrorMessage errorMessage: String) {
        // ...
    }
    
    func received(newViewState viewState: SignInViewState) {
        userInterface.render(newState: viewState)
    }
}

extension SignInViewController: KeyboardObserverEventResponder {
    func keyboardWillHide() {
        userInterface.moveContentForDismissedKeyboard()
    }
    
    func keyboardWillChangeFrame(keyboardEndFrame: CGRect) {
        let convertedKeyboardEndFrame = view.convert(keyboardEndFrame, from: view.window)
        userInterface.moveContent(forKeyboardFrame: convertedKeyboardEndFrame)
    }
}
