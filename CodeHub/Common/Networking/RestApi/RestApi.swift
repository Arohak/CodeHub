//
//  RestApi.swift
//  Panorama
//
//  Created by Ara Hakobyan on 29.07.21.
//

import APIClient
import Combine
import Foundation

class RestApi: WebServiceProtocol {}

// MARK: - TitanEndpoint

extension RestApi {
    
    func books(currentPage: Int, pageSize: Int) -> AnyPublisher<Response<PricebookDTO>, Error> {
        TitanEndpoint.services(currentPage: currentPage, pageSize: pageSize).execute(type: PricebookDTO.self)
    }
}

// MARK: - Stats

extension RestApi {
    func stats() -> AnyPublisher<Response<StatsDTO>, Error> {
        StatsEndpoint.items.execute(type: StatsDTO.self)
    }
}

// MARK: - Receipt

extension RestApi {
    func receipts() -> AnyPublisher<Response<ReceiptsDTO>, Error> {
        ReceiptEndpoint.items.execute(type: ReceiptsDTO.self)
    }

    func receipt(by id: Int) -> AnyPublisher<Response<ReceiptDTO>, Error> {
        ReceiptEndpoint.item(by: id).execute(type: ReceiptDTO.self)
    }

    func uploadReceipt(data: FormData) -> AnyPublisher<Response<String>, Error> {
        ReceiptEndpoint.upload(data: data).execute(type: String.self)
    }
}
