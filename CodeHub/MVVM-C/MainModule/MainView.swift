//
//  MainView.swift
//  CodeHub
//
//  Created by Ara Hakobyan on 11/11/20.
//

import UIKit
import DataProvider

class MainView: UIView {
    typealias CellView = MainTableCellContentView

    private lazy var tableView = makeTableView()
    private lazy var indicatorView = makeActivityIndicatorView()
    private lazy var errorLabel = makeLable()
    
    public func update(with data: MainViewData,
                       didSelect: Completion<PricebookDTO.Item>? = nil,
                       didScroll: Completion<UIScrollView>? = nil) {
        switch data {
        case .loading:
            backgroundColor = .orange
            indicatorView.startAnimating()
        case .success(let items):
            indicatorView.stopAnimating()
            tableView.updateData(sections: [items])
            tableView.didSelect = didSelect
            tableView.didScroll = didScroll
        case .failure(let error):
            backgroundColor = .white
            indicatorView.stopAnimating()
            errorLabel.text = error.localizedDescription
        }
    }
}

// MARK: - Views
extension MainView {
    func makeTableView() -> TableViewWithoutHeaderFooter<TableViewCell<CellView>, CellView> {
        let view = TableViewWithoutHeaderFooter<TableViewCell<CellView>, CellView>(
            settings: .init(shouldHighlightRows: [true])
        )
        addSubview(view)
        view.separatorStyle = .none
        view.backgroundColor = .lightGray
        view.anchors(
            top: .init(anchor: topAnchor),
            left: .init(anchor: leftAnchor),
            right: .init(anchor: rightAnchor),
            bottom: .init(anchor: bottomAnchor)
        )
        return view    }
    
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        addSubview(view)
        view.anchors(
            centerX: .init(anchor: centerXAnchor),
            centerY: .init(anchor: centerYAnchor)
        )
        return view
    }
    
    func makeLable() -> UILabel {
        let view = UILabel()
        addSubview(view)
        view.textColor = .red
        view.textAlignment = .center
        view.anchors(
            centerX: .init(anchor: centerXAnchor),
            centerY: .init(anchor: centerYAnchor)
        )
        return view
    }
}
