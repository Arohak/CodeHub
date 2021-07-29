//
//  DetailViewModel_.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 27.06.21.
//

import Foundation

protocol DetailViewModelType {
    func viewIsReady(completion: Completion<DetailViewData>?)
}

final class DetailViewModel_: DetailViewModelType {
    private var coordinator: DetailCoordinator
    private var data: DetailViewData

    init(coordinator: DetailCoordinator, data: DetailViewData) {
        self.coordinator = coordinator
        self.data = data
    }
    
    func viewIsReady(completion: Completion<DetailViewData>?) {
        completion?(data)
    }
}
