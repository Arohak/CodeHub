//
//  Navigator.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 13.07.21.
//

import UIKit

protocol Navigatable {
    var navigator: Navigator! { get set }
}

class Navigator {
    static var `default` = Navigator()

    public enum Transition {
        case root(in: UIWindow)
        case modal(UIModalPresentationStyle = .fullScreen)
        case push
        case alert
    }

    public enum Scene {
        case main(viewModel: MainViewModel)
        case detail(viewModel: DetailViewModel)
    }
    
    public func show(scene: Scene, sender: UIViewController? = nil, transition: Transition = .push) {
        guard let target = getTarget(for: scene) else { return }
        show(target: target, sender: sender, transition: transition)
    }
        
    private func getTarget(for scene: Scene) -> UIViewController? {
        switch scene {
        case .main(let vm):
            let vc = MainViewController(viewModel: vm, navigator: self)
            let nav = UINavigationController(rootViewController: vc)
            return nav
        case .detail(let vm):
            return DetailViewController(viewModel: vm, navigator: self)
        }
    }
    
    private func show(target: UIViewController, sender: UIViewController? = nil, transition: Transition = .push) {
        if case .root(in: let window) = transition {
            window.rootViewController = target
            return
        }

        guard let sender = sender else {
            fatalError("You need to pass in a sender.")
        }

        if let nav = sender as? UINavigationController {
            nav.pushViewController(target, animated: false)
            return
        }

        switch transition {
        case .modal(let style):
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: target)
                nav.modalPresentationStyle = style
                sender.present(nav, animated: true, completion: nil)
            }
        case .push:
            DispatchQueue.main.async {
                sender.navigationController?.pushViewController(target, animated: true)
            }
        case .alert:
            DispatchQueue.main.async {
                sender.present(target, animated: true, completion: nil)
            }
        default: break
        }
    }
}
