//
//  DetailViewController_.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 27.06.21.
//

import UIKit

class DetailViewController_: UIViewController {
    private var viewModel: DetailViewModelType!
    private let mainView = DetailView()
    
    init(with viewModel: DetailViewModelType) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        mainView.backgroundColor = .white
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewIsReady()
    }
    
    private func viewIsReady() {
        viewModel.viewIsReady { [weak self] data in
            self?.mainView.update(with: data)
        }
    }
}
