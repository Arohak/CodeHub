//
//  ReceiptsDTO.swift
//  Panorama
//
//  Created by Ara Hakobyan on 29.07.21.
//

import Foundation

public struct ReceiptsDTO: Codable {
    let totalRecepts: Int
    let unprocessedReceipts: Int
    let receipts: [Receipt]

    struct Receipt: Codable {
        let id: Int
        let retailerName: String
        let dateTime: String
        let totalAmount: Double
        let status: Status
        let starred: Bool

        enum Status: String, Codable {
            case done
            case unprocessed
        }
    }
}
