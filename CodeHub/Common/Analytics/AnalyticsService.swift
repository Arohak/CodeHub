//
//  AnalyticsService.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 5/7/23.
//

import UIKit

protocol AnalyticsService: AnyObject {
    func initialize()
    func shouldTrack(_ event: AnalyticsEvent) -> Bool
    func track(_ event: AnalyticsEvent)
}

extension AnalyticsService {
    func shouldTrack(_ event: AnalyticsEvent) -> Bool { true }
}

protocol AnalyticsEvent {
    var name: String { get }
    var params: [String: Any?] { get }
}
