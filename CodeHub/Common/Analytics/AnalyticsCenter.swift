//
//  AnalyticsCenter.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 5/7/23.
//

import UIKit

public final class AnalyticsCenter: AnalyticsService {
    static let shared = AnalyticsCenter(with: [.amplitude, .mixpanel])
    
    private let services: [AnalyticsService]
    
    private init(with serviceTypes: [AnalyticsServiceIntegrationType]) {
        services = serviceTypes.compactMap { $0.analyticsService }
    }
    
    func initialize() {
        services.forEach { $0.initialize() }
    }

    func track(_ event: AnalyticsEvent) {
        services
            .filter { $0.shouldTrack(event) }
            .forEach { $0.track(event) }
    }
    
}

public enum AnalyticsServiceIntegrationType {
    case amplitude
    case mixpanel

    var analyticsService: AnalyticsService {
        switch self {
        case .amplitude:
            return AmplitudeAnalyticsService()
        case .mixpanel:
            return MixpanelAnalyticsService()
        }
    }
}
