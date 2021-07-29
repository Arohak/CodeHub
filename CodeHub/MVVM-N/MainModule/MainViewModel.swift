//
//  MainViewModel.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import Foundation
import Combine

final class MainViewModel: ViewModel {

}

// MARK: - ViewModelType
extension MainViewModel: ViewModelType {
    typealias Input = Void

    struct Output {
        let value: CurrentValueSubject<MainViewData, Never>
    }
    
    func transform(_ input: Input) -> Output {
        let value = CurrentValueSubject<MainViewData, Never>(.loading)

        webService.books(currentPage: 1, pageSize: 2)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    value.send(.failure(error))
                case .finished:
                    print("Finish")
                }
            }, receiveValue: {
                value.send(.success($0.value.data))
            })
            .store(in: &disposables)
        
        return .init(value: value)
    }
}
