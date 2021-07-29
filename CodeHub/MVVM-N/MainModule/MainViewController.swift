//
//  MainViewController.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 04.07.21.
//

import UIKit
import Combine

class MainViewController: ViewController {
    private let rootView = MainView()
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel() {
        guard let viewModel = viewModel as? MainViewModel else { return }
                
        let output = viewModel.transform(Void())
        
        let didSelect: Completion<PricebookDTO.Item> = { [weak self] item in
            let viewModel = DetailViewModel(data: .init(title: item.name, desc: "\(item.price)"),
                                            webService: viewModel.webService)
            self?.navigator.show(scene: .detail(viewModel: viewModel), sender: self, transition: .push)
        }
        
        output.value
            .sink { [weak self] data in
                self?.rootView.update(with: data, didSelect: didSelect)
            }
            .store(in: &disposables)
    }
}
