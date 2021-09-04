//
//  ViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 26/08/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var button: GreenRoundedButton = {
        let button = GreenRoundedButton.getSupportButton()
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        return button
    }()
    
    @objc func pressed() {
        self.present(ProjectViewController(), animated: true)
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
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
            UINavigationController(rootViewController: ViewController())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
}
#endif
