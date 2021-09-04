//
//  ShowProjectViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

class ShowProjectViewController: UIViewController {
    lazy var supportButton: GreenRoundedButton = {
        return GreenRoundedButton.getSupportButton()
    }()

    var canEditProject = true

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground

        setupNavigationRightItens()

        view.addSubview(supportButton)

        supportButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupNavigationRightItens() {
        let shareImage = UIImage(systemName: "square.and.arrow.up")
        let shareButton = UIBarButtonItem(image: shareImage, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [shareButton]

        if canEditProject {
            let editImage = UIImage(systemName: "pencil")
            let editButton = UIBarButtonItem(image: editImage, style: .plain, target: nil, action: nil)
            navigationItem.rightBarButtonItems?.append(editButton)
        }
    }
}

#if DEBUG
import SwiftUI
struct ShowProjectViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            let vc = ShowProjectViewController()
            let navigationController = UINavigationController(rootViewController: vc)

            return navigationController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
}
#endif

