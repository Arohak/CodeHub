//
//  MixpanelAnalyticsService.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 5/8/23.
//

import UIKit

class MixpanelAnalyticsService: AnalyticsService {
    func initialize() {
//        Mixpanel.initialize(token: token)
//        Mixpanel.mainInstance().identify(distinctId: Mixpanel.mainInstance().distinctId)
    }

    func track(_ event: AnalyticsEvent) {
        guard shouldTrack(event) else { return }
        print("TrackedEvent: \(event.name) ( \(event.params) )")
//        let properties = event.params.compactMapValues { $0 } as? Properties
//        Mixpanel.mainInstance().track(event: event.name, properties: properties)
    }
}

// 1 enum approach
enum MixpanelAnalyticsEvent: AnalyticsEvent {
    case screenView(name: String, source: String?) // source where the user opened the given screen
    case cmpStatusChange(status: Bool, services: [Any]) // "confirmed", "manually selected" / cmp services
    case locationSettingChanged(value: String?, source: String) // "DE" / "AT"
    
    var name: String {
        switch self {
        case .screenView: return "Screen View"
        case .cmpStatusChange: return "CMP status change"
        case .locationSettingChanged: return "Location setting changed"
        }
    }
    
    var params: [String: Any?] {
        switch self {
        case let .screenView(name, source):
            return [
                "Screen name": name,
                "Source": source
            ]
        case let .cmpStatusChange(isConfirmed, services):
            return [
                "Status": isConfirmed ? "confirmed" : "manually selected",
                "Services": services
            ]
        case let .locationSettingChanged(value, source):
            return [
                "Country": value,
                "Source": source
            ]
        }
    }
}

// 2 struct approach
struct MixpanelAnalyticsEventObj: AnalyticsEvent {
    var name: String
    var params: [String: Any?]
    
    static func screenView(name: String, params: [String: Any]) -> Self {
        Self(name: name, params: params)
    }
}
