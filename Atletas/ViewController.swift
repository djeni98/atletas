//
//  ViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 26/08/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
}

#if DEBUG
import SwiftUI
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: ViewController())
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
}
#endif
