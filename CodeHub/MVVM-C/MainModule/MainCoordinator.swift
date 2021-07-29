//
//  MainCoordinator.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import UIKit

class MainCoordinator: Coordinator {
    var childs: [Coordinator] = []
    
    private var window: UIWindow
    private var navigationViewController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewModel = MainViewModel_(coordinator: self)
        let viewController = MainViewController_(with: viewModel)
        navigationViewController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
    
    func pushToDetail(_ data: DetailViewData) {
        let detailCoordinator = DetailCoordinator(navigationViewController: navigationViewController, data: data)
        childs.append(detailCoordinator)
        detailCoordinator.start()
    }
}
