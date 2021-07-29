//
//  SceneDelegate.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 11/11/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var navigator = Navigator.default
    private var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        Application.shared.presentInitialScreen(in: window)
        window.makeKeyAndVisible()
        self.window = window
        
//        coordinator = MainCoordinator(window: window)
//        coordinator?.start()
        
        print(Configuration.App.baseUrl)
    }
}

