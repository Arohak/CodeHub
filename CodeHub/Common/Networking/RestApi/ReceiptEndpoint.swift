//
//  ReceiptEndpoint.swift
//  Panorama
//
//  Created by Ara Hakobyan on 29.07.21.
//

import APIClient
import Foundation

enum ReceiptEndpoint {
    case items
    case item(by: Int)
    case upload(data: FormData)
}

extension ReceiptEndpoint: APIClient {
    var baseUrl: URL {
        Configuration.App.baseUrl
    }

    var path: String {
        switch self {
        case .items:
            return "/receipts"
        case let .item(id):
            return "/receipt/\(id)"
        case .upload:
            return "receipt/upload"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .items, .item:
            return .get
        case .upload:
            return .post
        }
    }

    var file: FormData? {
        switch self {
        case .items, .item:
            return nil
        case let .upload(data):
            return data
        }
    }
}
