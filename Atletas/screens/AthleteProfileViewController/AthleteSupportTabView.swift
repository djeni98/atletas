//
//  AthleteSupportTabView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 08/09/21.
//

import UIKit

class AthleteSupportTabView: UIView {
    var athlete: Athlete? {
        didSet {
            guard let athlete = athlete else { return }

            aboutTextLabel.text = athlete.about
            projectsLabel.text = "Projetos de \(athlete.getFirstName())"
            self.setProjects(athlete.projects)
        }
    }

    lazy var aboutTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "SecondaryFont")
        let largeText = Array(1...200).reduce("", { $0 + "\($1)"})
        label.text = largeText
        label.numberOfLines = 0

        return label
    }()

    lazy var projectsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor(named: "PrimaryFont")
        label.text = "Projetos"

        return label
    }()

    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        setupAbout()
        setupProjects()

        self.snp.makeConstraints { make in
            make.bottom.equalTo(stackView)
        }
    }

    func setupAbout() {
        let aboutLabel = UILabel()
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        aboutLabel.textColor = UIColor(named: "PrimaryFont")
        aboutLabel.text = "Sobre"

        self.addSubview(aboutLabel)
        aboutLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(32)
        }

        self.addSubview(aboutTextLabel)
        aboutTextLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutLabel.snp.bottom).offset(8)

            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
    }

    func setupProjects() {
        self.addSubview(projectsLabel)
        projectsLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutTextLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
        }

        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(projectsLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
    }

    func setProjects(_ projects: [Project]) {
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        projects.forEach { project in
            let card = ProjectCardView(project: project)
            stackView.addArrangedSubview(card)
        }
    }
}

#if DEBUG
import SwiftUI
struct AthleteSupportTabView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                let view = AthleteSupportTabView()
                let projects: [Project] = Array(1...3).map { n in
                    return Project(title: "Proj \(n)", image: UIImage(named: "???")!, about: "", goal: 100, deadline: "12/12/2021", sport: .softball, category: .brazilianTeam)
                }
                view.setProjects(projects)

                return view
            }


        }.previewLayout(.fixed(width: 400, height: 800))
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = {
                let superView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
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
