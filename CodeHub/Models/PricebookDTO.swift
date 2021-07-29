//
//  PricebookDTO.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 11/11/20.
//

import Foundation

struct PricebookDTO: Codable {
    var page: Int
    var pageSize: Int
    var totalCount: Int
    var hasMore: Bool
    var data: [Item]
    
    struct Item: Codable {
        var id: Int
        var name: String?
        var price: Double
    }
}
