//
//  ShowProjectViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

class ShowProjectViewController: UIViewController {
    lazy var supportButton: GreenRoundedButton = {
        let button = GreenRoundedButton.getSupportButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray

        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        label.textColor = .white

        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white

        return label
    }()

    var canEditProject = true

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground

        setupNavigationRightItens()
        setupImageAndTitle()
        setupButton()
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

    func setupImageAndTitle() {
        titleLabel.text = "Sul Americano 2022"
        subtitleLabel.text = "12 dias restantes"

        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)

        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(16)
            make.leading.equalTo(imageView).offset(16)
            make.trailing.equalTo(imageView).offset(-16)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
        }
    }

    func setupButton() {
        view.addSubview(supportButton)

        supportButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(imageView.snp.bottom)
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

