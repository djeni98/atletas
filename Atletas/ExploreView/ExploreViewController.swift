//
//  ExploreViewController.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class ExploreViewController: UIViewController {    
    lazy var contentView: ExploreContentView = {
        let contentView = ExploreContentView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    override func loadView() {
        super.loadView()
        
        setupContent()
    }
    
    func setupContent() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
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
