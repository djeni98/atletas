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
    var project: Project = {
        let image = UIImage(named: "???")!
        let project = ProjectDataModule.shared.projects[0].clone()

        return project
    }() {
        didSet {
            imageAndTitleView.update(with: project)
            projectMetricsView.update(with: project)
            aboutView.update(withText: project.about)
        }
    }

    lazy var supportButton: GreenRoundedButton = {
        let button = GreenRoundedButton.getSupportButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(navigateToSupport), for: .touchUpInside)

        return button
    }()

    lazy var imageAndTitleView: ImageAndTitleView = {
        let subtitle = project.getRemainingTimeInString()
        let view = ImageAndTitleView(title: project.title, subtitle: subtitle, image: project.image)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var projectMetricsView: ProjectMetricsView = {
        let view = ProjectMetricsView(
            collectedValue: project.getValueCollected(),
            goalValue: project.goal,
            deadline: project.deadline
        )
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var aboutView: AboutView = {
        let view = AboutView(aboutText: project.about)
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

    var canEditProject = false

    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor(named: "background")
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setup() {
        setupNavigationRightItens()

        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)

        let headerView = getHeader()

        scrollViewContainer.addArrangedSubview(headerView)
        scrollViewContainer.addArrangedSubview(projectMetricsView)
        scrollViewContainer.addArrangedSubview(aboutView)
        scrollViewContainer.alignment = .center

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
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0))
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

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(clickedCancel))
    }

    @objc func clickedCancel() {
        dismiss(animated: true, completion: nil)
    }

    @objc func navigateToSupport() {
        let projectVC = ProjectViewController()
        projectVC.update(with: project)
        navigationController?.pushViewController(projectVC, animated: true)
    }
}

#if DEBUG
import SwiftUI
struct ShowProjectViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
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

