//
//  MainViewModel.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 26.06.21.
//

import Foundation
import Combine
import UIKit

protocol MainViewModelType {
    func viewIsReady(completion: Completion<MainViewData>?)
    func didSelect(item: PricebookDTO.Item)
    func didScroll(completion: Completion<MainViewData>?)
}

final class MainViewModel_ {
    private var disposables = Set<AnyCancellable>()
    private var coordinator: MainCoordinator
    private var count: Int = 10
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    private func fetch(_ completion: Completion<MainViewData>?) {
        TitanEndpoint.services(currentPage: 1, pageSize: count).execute(type: PricebookDTO.self)
            .sink(receiveCompletion: { value in
                switch value {
                case .failure(let error):
                    completion?(.failure(error))
                case .finished:
                    print("Finish")
                }
            }, receiveValue: {
                completion?(.success($0.value.data))
            })
            .store(in: &disposables)
    }
}

extension MainViewModel_: MainViewModelType {
    func viewIsReady(completion: Completion<MainViewData>?) {
        completion?(.loading)
        fetch(completion)
    }

    func didSelect(item: PricebookDTO.Item) {
        let data = DetailViewData(title: item.name, desc: "\(item.price)")
        coordinator.pushToDetail(data)
    }
    
    func didScroll(completion: Completion<MainViewData>?) {
        count += 10
        fetch(completion)
    }
}
