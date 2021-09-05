//
//  ShowProjectViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

// Reference for UIScrollView - "Swift - Creating a vertical UIScrollView programmatically"
// https://stackoverflow.com/a/54860024

class ShowProjectViewController: UIViewController {
    lazy var supportButton: GreenRoundedButton = {
        let button = GreenRoundedButton.getSupportButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var imageAndTitleView: ImageAndTitleView = {
        let view = ImageAndTitleView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var projectMetricsView: ProjectMetricsView = {
        let view = ProjectMetricsView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var aboutView: AboutView = {
        let view = AboutView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 32

        return view
    }()

    var canEditProject = true

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
        setup()
    }

    func setup() {
        setupNavigationRightItens()

        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)

        let headerView = getHeader()

        scrollViewContainer.addArrangedSubview(headerView)
        scrollViewContainer.addArrangedSubview(projectMetricsView)
        scrollViewContainer.addArrangedSubview(aboutView)

        headerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }

        projectMetricsView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }

        aboutView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

        scrollViewContainer.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            // this is important for scrolling
            make.width.equalTo(scrollView)
        }
    }

    func getHeader() -> UIView {
        let view = UIView()

        view.addSubview(imageAndTitleView)
        view.addSubview(supportButton)

        imageAndTitleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }

        supportButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(imageAndTitleView.snp.bottom)
        }

        view.translatesAutoresizingMaskIntoConstraints = false
        view.snp.makeConstraints { make in
            make.bottom.equalTo(supportButton)
        }

        return view
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

