//
//  DetailCoordinator.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import UIKit

final class DetailCoordinator: Coordinator {
    var childs: [Coordinator] = []
    
    private var navigationViewController: UINavigationController
    private var data: DetailViewData

    init(navigationViewController: UINavigationController, data: DetailViewData) {
        self.navigationViewController = navigationViewController
        self.data = data
    }
    
    func start() {
        let viewModel = DetailViewModel_(coordinator: self, data: data)
        let viewController = DetailViewController_(with: viewModel)
        navigationViewController.pushViewController(viewController, animated: true)
    }
}
