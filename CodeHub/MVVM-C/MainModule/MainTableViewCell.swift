//
//  MainTableViewCell.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 11/11/20.
//

import UIKit
import Combine
import DataProvider

//class MainTableViewCell: TableViewCell<MainTableCellContentView> {
//    
//
//}

class MainTableCellContentView: UIView, ContainerView {
    private var disposables = Set<AnyCancellable>()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .orange
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.textColor = .red
        return view
    }()
    
    private var thumbImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUI() {
        addSubview(thumbImageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        
        thumbImageView.anchors(top: .init(anchor: topAnchor, constant: 10),
                               left: .init(anchor: leftAnchor, constant: 10),
                               height: 50,
                               width: 50)
        
        nameLabel.anchors(top: .init(anchor: thumbImageView.bottomAnchor, constant: 10),
                          left: .init(anchor: leftAnchor, constant: 10),
                          right: .init(anchor: rightAnchor, constant: 10))
        
        priceLabel.anchors(top: .init(anchor: nameLabel.bottomAnchor, constant: 5),
                           left: .init(anchor: leftAnchor, constant: 10),
                           right: .init(anchor: rightAnchor, constant: 10),
                           bottom: .init(anchor: bottomAnchor, constant: 10))
    }
    
    func update(with model: PricebookDTO.Item) {
        nameLabel.text = model.name
        priceLabel.text = "\(model.price)"
        loadImage(with: model.id)
    }
    
    private func loadImage(with id: Int) {
        TitanEndpoint.image(id: id).execute()
            .sink(receiveCompletion: { _ in
            }, receiveValue: { [weak self] in
                self?.thumbImageView.image = UIImage(data: $0)
            })
            .store(in: &disposables)
    }
}
