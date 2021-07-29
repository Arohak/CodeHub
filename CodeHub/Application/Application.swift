//
//  Application.swift
//  Panorama
//
//  Created by Ara Hakobyan on 28.07.21.
//

import UIKit

final class Application: NSObject {
    static let shared = Application()

    var window: UIWindow?
    let navigator: Navigator
    let webService: WebServiceProtocol

    override private init() {
        navigator = Navigator.default
        webService = RestApi()
        super.init()
    }

    func presentInitialScreen(in window: UIWindow?) {
        guard let window = window else { return }
        self.window = window
        let viewModel = MainViewModel(webService: webService)
        navigator.show(scene: .main(viewModel: viewModel), transition: .root(in: window))
    }
}
