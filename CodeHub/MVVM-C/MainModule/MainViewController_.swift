//
//  MainViewController.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 26.06.21.
//

import UIKit

class MainViewController_: UIViewController {
    private var viewModel: MainViewModelType!
    private let mainView = MainView()
    
    init(with viewModel: MainViewModelType) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewIsReady()
    }

    private func viewIsReady() {
        viewModel.viewIsReady { [weak self] data in
            self?.mainView.update(with: data, didSelect: self?.didSelect, didScroll: self?.didScroll)
        }
    }
    
    private func didSelect(item: PricebookDTO.Item) {
        viewModel.didSelect(item: item)
    }
    
    private func didScroll(scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let bottomInset = scrollView.contentSize.height - 100
        let viewHeight = scrollView.frame.size.height
        if position > bottomInset - viewHeight {
//            viewModel.didScroll { [weak self] data in
//                self?.mainView.update(with: data, didSelect: self?.didSelect, didScroll: self?.didScroll)
//            }
        }
    }
}
