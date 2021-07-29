//
//  DetailViewModel.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import Combine

final class DetailViewModel: ViewModel {
    private var data: DetailViewData

    init(data: DetailViewData, webService: WebServiceProtocol) {
        self.data = data
        super.init(webService: webService)
    }
}

// MARK: - ViewModelType
extension DetailViewModel: ViewModelType {
    typealias Input = Void
    
    struct Output {
        let value: CurrentValueSubject<DetailViewData, Never>
    }
    
    func transform(_ input: Void) -> Output {
        let value = CurrentValueSubject<DetailViewData, Never>(data)

        return .init(value: value)
    }
}
