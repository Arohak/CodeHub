//
//  WebServiceProtocol.swift
//  Panorama
//
//  Created by Ara Hakobyan on 29.07.21.
//

import APIClient
import Combine
import Foundation

protocol WebServiceProtocol {
    // MARK: - TitanEndpoint

    func books(currentPage: Int, pageSize: Int) -> AnyPublisher<Response<PricebookDTO>, Error>
    
    // MARK: - Stats

    func stats() -> AnyPublisher<Response<StatsDTO>, Error>

    // MARK: - Receipt

    func receipts() -> AnyPublisher<Response<ReceiptsDTO>, Error>
    func receipt(by id: Int) -> AnyPublisher<Response<ReceiptDTO>, Error>
    func uploadReceipt(data: FormData) -> AnyPublisher<Response<String>, Error>

}
