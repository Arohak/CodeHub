//
//  MainViewData.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 27.06.21.
//

import Foundation

enum MainViewData {
    case loading
    case success([PricebookDTO.Item])
    case failure(Error)
}
