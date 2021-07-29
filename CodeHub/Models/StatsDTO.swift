//
//  StatsDTO.swift
//  Panorama
//
//  Created by Ara Hakobyan on 29.07.21.
//

import Foundation

public struct StatsDTO: Codable {
    let total: Double
    let receipts: Int
    let unprocessed: Int
    let categories: [Category]

    struct Category: Codable {
        let name: String
        let count: Int
        let totalPrice: Double
        let pricePercentage: Double
        let quantityPercentage: Double
        let categories: [Category]
    }
}
