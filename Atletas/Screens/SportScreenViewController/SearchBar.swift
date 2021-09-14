//
//  SearchBar.swift
//  Atletas
//
//  Created by Guilerme Barciki on 09/09/21.
//

import UIKit

class SearchBar: UIView {
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    var searchBarDelegate: UISearchBarDelegate?


    init(width: CGFloat) {
        let searchBarHeight: CGFloat = 36 + 2*8
        
        let height: CGFloat = searchBarHeight

        let frame = CGRect(x: width / 2, y: height / 2, width: width, height: height)
        super.init(frame: frame)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDelegate(_ delegate: UISearchBarDelegate) {
        self.searchBarDelegate = delegate
        self.searchBar.delegate = searchBarDelegate
    }

    func setup() {
        setupViewsLayout()
    }

    func setupViewsLayout() {
        addSubview(searchBar)

        let trailingConstraint = searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        trailingConstraint.priority = .defaultHigh

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            trailingConstraint
        ])
    }

}

#if DEBUG
import SwiftUI
struct SearchBar_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                SearchBar()
            }
        }
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = viewBuilder
        }

        func makeUIView(context: Context) -> some UIView {
            viewBuilder()
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {
            // Not needed
        }
    }
}
#endif
