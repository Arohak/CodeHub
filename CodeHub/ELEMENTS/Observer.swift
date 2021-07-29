//
//  Observer.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 10.07.21.
//

import Foundation

protocol Observer {
    func startObserving()
    func stopObserving()
}

class ObserverComposition: Observer {
    
    let observers: [Observer]
    
    init(observers: Observer...) {
        self.observers = observers
    }
    
    func startObserving() {
        observers.forEach {
            $0.startObserving()
        }
    }
    
    func stopObserving() {
        observers.forEach {
            $0.stopObserving()
            
        }
    }
}
