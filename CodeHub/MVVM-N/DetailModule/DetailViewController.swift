//
//  DetailViewController.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import UIKit
import Combine

class DetailViewController: ViewController {
    private let rootView = DetailView()
    
    override func loadView() {
        super.loadView()
        rootView.backgroundColor = .white
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel() {
        guard let viewModel = viewModel as? DetailViewModel else { return }

        let output = viewModel.transform(Void())
        
        output.value
            .sink { [weak self] data in
                self?.rootView.update(with: data)
            }
            .store(in: &disposables)

    }
}
