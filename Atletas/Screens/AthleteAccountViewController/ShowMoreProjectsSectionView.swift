//
//  ShowMoreProjectsSectionView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 06/09/21.
//

import UIKit

class ShowMoreProjectsSectionView: UIView {
    var navigationController: UINavigationController?
    
    let headerView: TitleAndShowMoreButtonView = {
        let view = TitleAndShowMoreButtonView()
        view.setTitle(withText: "Meus Projetos")
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8

        return view
    }()

    init(projects: [Project], showMoreAction: @escaping () -> Void) {
        super.init(frame: .zero)
        setup(projects: projects, showMoreAction: showMoreAction)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let projects: [Project] = Array(1...3).map { n in
            return Project(title: "Proj \(n)", image: UIImage(named: "???")!, about: "", goal: 100, deadline: "12/12/2021", sport: .softball, category: .brazilianTeam)
        }
        setup(projects: projects, showMoreAction: {})
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(projects: [Project], showMoreAction: @escaping () -> Void) {
        setupHeader(withAction: showMoreAction)
        setupStackView(withProjects: projects)

        self.snp.makeConstraints { make in
            make.bottom.equalTo(stackView)
        }
    }

    func setShowMoreAction(_ action: @escaping () -> Void) {
        headerView.setShowMoreAction(with: action)
    }

    func setupHeader(withAction action: @escaping () -> Void) {
        headerView.setShowMoreAction(with: action)

        self.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    func setProjects(_ projects: [Project]) {
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        projects.forEach { project in
            let card = ProjectCardView(project: project)
            card.setTapGestureToCallAction {
                let viewController = UINavigationController(rootViewController: ShowProjectViewController())
                viewController.modalPresentationStyle = .fullScreen
                self.navigationController?.present(viewController, animated: true, completion: nil)
            }
            stackView.addArrangedSubview(card)
        }
    }

    func setupStackView(withProjects projects: [Project]) {
        self.addSubview(stackView)

        setProjects(projects)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(12)

            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}


#if DEBUG
import SwiftUI
struct ShowMoreProjectsSectionView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                ShowMoreProjectsSectionView()
            }

        }.previewLayout(.fixed(width: 400, height: 600))
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = {
                let superView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))
                let view = viewBuilder()

                superView.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = true
                view.snp.makeConstraints { make in
                    make.centerY.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.width.equalTo(375)
                }

                return superView
            }
        }

        func makeUIView(context: Context) -> some UIView {
            viewBuilder()
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {
            // Not needed
        }
    }
}
#endif
