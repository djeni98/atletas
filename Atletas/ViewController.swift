//
//  ViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 26/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.sizeToFit()
        view.addSubview(searchBar)
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Ajude um atleta"
        
    }


}

#if DEBUG
import SwiftUI
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            return ViewController()
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
}
#endif
