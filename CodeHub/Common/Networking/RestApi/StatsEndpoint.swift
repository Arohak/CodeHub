//
//  StatsEndpoint.swift
//  Panorama
//
//  Created by Ara Hakobyan on 29.07.21.
//

import APIClient
import Foundation

enum StatsEndpoint {
    case items
}

extension StatsEndpoint: APIClient {
    var baseUrl: URL {
        Configuration.App.baseUrl
    }

    var path: String {
        "/stats"
    }
}
