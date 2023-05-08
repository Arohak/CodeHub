//
//  AmplitudeAnalyticsService.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 5/8/23.
//

import UIKit

class AmplitudeAnalyticsService: AnalyticsService {
    func initialize() {

    }
    
    func track(_ event: AnalyticsEvent) {
        
    }
}

enum AmplitudeAnalyticsEvent: AnalyticsEvent {
    case uploaded
    case signin(Bool)
    
    var name: String {
        switch self {
        case .uploaded:
            return "vgismc"
        case let .signin(state):
            return state ? "cpd6b8" : "5d6kkt"
        }
    }
    
    var params: [String: Any?] { [:] }
}
