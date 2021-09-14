//
//  SearchBarWithScopeButton.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 01/09/21.
//

import UIKit

class SearchBarWithScopeButton: UIView {
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    var searchBarDelegate: UISearchBarDelegate?

    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        for (index, segment) in SearchScopeButton.allCases.enumerated() {
            let title = segment.rawValue
            segmentedControl.insertSegment(withTitle: title, at: index, animated: true)
        }

        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    init(width: CGFloat) {
        let searchBarHeight: CGFloat = 36 + 2*8
        let segmentedControlHeight: CGFloat = 32 + 2*8
        let height: CGFloat = searchBarHeight + segmentedControlHeight

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
        setupSegmentedControlActions()
    }

    func setupViewsLayout() {
        addSubview(searchBar)
        addSubview(segmentedControl)

        searchBar.scopeButtonTitles = SearchScopeButton.allCases.map { $0.rawValue }
        searchBar.selectedScopeButtonIndex = segmentedControl.selectedSegmentIndex

        let searchBarTrailingConstraint = searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        searchBarTrailingConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            searchBarTrailingConstraint,

            segmentedControl.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 8),
            segmentedControl.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant:  -8)
        ])
    }

    func setupSegmentedControlActions() {
        for (index, segment) in SearchScopeButton.allCases.enumerated() {
            let title = segment.rawValue
            let action = UIAction() { _ in
                self.searchBar.selectedScopeButtonIndex = index
                self.searchBarDelegate?.searchBar?(self.searchBar, selectedScopeButtonIndexDidChange: index)
            }
            segmentedControl.setAction(action, forSegmentAt: index)
            segmentedControl.setTitle(title, forSegmentAt: index)
        }
    }
}

#if DEBUG
import SwiftUI
struct SearchBarController_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                SearchBarWithScopeButton()
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

