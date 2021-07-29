//
//  ViewController.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import UIKit
import Combine

class ViewController: UIViewController, Navigatable {
    internal var disposables = Set<AnyCancellable>()

    var viewModel: ViewModel?
    var navigator: Navigator!

    init(viewModel: ViewModel?, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Deinit: \(String(describing: self))")
    }
}
