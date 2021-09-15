//
//  ExploreViewController.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class ExploreViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: ExploreContentView = {
        let view = ExploreContentView(navigationController: navigationController)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        setupContent()
    }
    
    func setupContent() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0))
            make.width.equalTo(scrollView)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "background")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Ajude um atleta"
    }
    
}

#if DEBUG
import SwiftUI
struct ExploreViewController_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: ExploreViewController())
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
}
#endif
