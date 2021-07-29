//
//  TitanEndpoint.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 01.04.21.
//

import Foundation
import APIClient

enum TitanEndpoint {
    case services(currentPage: Int, pageSize: Int)
    case image(id: Int)
}

extension TitanEndpoint: APIClient {
    var baseUrl: URL {
        switch self {
        case .services:
            return URL(string: "https://api.servicetitan.com/v1")!
        case .image(let id):
            return URL(string: "https://picsum.photos/id/\(id % 1000)/75/75")!
        }
    }
    
    var path: String {
        switch self {
        case .services:
            return "/services"
        case .image:
            return ""
        }
    }
    
    var queryItems: [URLQueryItem] {
        var temp: [String: String] = [
            "serviceTitanApiKey": "45b2c77d-332c-4aec-8595-a2a47b7e9356",
        ]
        switch self {
        case .services(let currentPage, let pageSize):
            temp["filter.page"] = "\(currentPage)"
            temp["filter.pageSize"] = "\(pageSize)"
        case .image:
            break
        }
        return temp.map { .init(name: $0.key, value: $0.value) }
    }
}
