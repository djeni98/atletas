//
//  ExplorarViewController.swift
//  Atletas
//
//  Created by André Schueda on 31/08/21.
//

import UIKit

class ExplorarViewController: UIViewController {
    var pageTitle: UILabel!
    var searchBar: UISearchBar!
    
    override func loadView() {
        view = UIView()
        
        pageTitle = UILabel()
        
        pageTitle.translatesAutoresizingMaskIntoConstraints = false
        pageTitle.textAlignment = .left
        pageTitle.text = "Ajude um atleta"
        pageTitle.font = UIFont.boldSystemFont(ofSize: 34.0)
        view.addSubview(pageTitle)
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.backgroundColor = .none
        searchBar.placeholder = "Procura"
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            pageTitle.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: pageTitle.topAnchor, constant: 9),
//            searchBar.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        ])
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

#if DEBUG
import SwiftUI
struct ExplorarViewController_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            return ExplorarViewController()
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
}
#endif
