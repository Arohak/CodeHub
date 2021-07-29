//
//  ViewModel.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import Foundation
import Combine

class ViewModel {
    internal var disposables = Set<AnyCancellable>()
    internal let webService: WebServiceProtocol
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    deinit {
        print("Deinit: \(String(describing: self))")
    }
}
