//
//  SignInStateObserver.swift
//  Elements
//
//  Created by Ara Hakobyan on 4/14/20.
//  Copyright © 2020 Ara Hakobyan. All rights reserved.
//

import Combine
import UIKit

class SignInStateObserver: Observer {
    
    weak var eventResponder: SignInStateObserverEventResponder? {
        willSet {
            if newValue == nil {
                stopObserving()
            }
        }
    }
    
    private let state: AnyPublisher<SignedInViewControllerState, Never>
    private var errorStateSubscription: AnyCancellable?
    private var viewStateSubscription: AnyCancellable?
    private var cancellableSet: Set<AnyCancellable> = []

    private var isObserving: Bool {
        if errorStateSubscription != nil && viewStateSubscription != nil {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Methods
    init(state: AnyPublisher<SignedInViewControllerState, Never>) {
        self.state = state
    }
    
    func startObserving() {
        assert(self.eventResponder != nil)
        
        guard let _ = self.eventResponder else {
            return
        }
        
        if isObserving {
            return
        }
        
        subscribeToErrorMessages()
        subscribeToSignInViewState()
    }
    
    func stopObserving() {
        unsubscribeFromSignInViewState()
        unsubscribeFromErrorMessages()
    }
    
    func subscribeToSignInViewState() {
        viewStateSubscription = state
            .map { $0.viewState }
            .sink { [weak self] viewState in
                self?.eventResponder?.received(newViewState: viewState)
            }
        viewStateSubscription?.store(in: &cancellableSet)
    }
    
    func subscribeToErrorMessages() {
        errorStateSubscription = state
            .map { $0.errorsToPresent.first ?? "" }
            .sink { [weak self] errorMessage in
                self?.eventResponder?.received(newErrorMessage: errorMessage)
            }
        errorStateSubscription?.store(in: &cancellableSet)
    }
    
    func unsubscribeFromSignInViewState() {
        viewStateSubscription?.cancel()
    }
    
    func unsubscribeFromErrorMessages() {
        errorStateSubscription?.cancel()
    }
}
