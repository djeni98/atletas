//
//  ProjectCardView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 06/09/21.
//

import UIKit

class ProjectCardView: UIView {
    var project: Project? {
        didSet {
            guard let project = project else { return }
            setProject(project)
        }
    }

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "???")!

        return imageView
    }()

    lazy var progressView: ProjectProgressView = {
        let view = ProjectProgressView(percentage: 0.5, title: "Sul Americano 2022")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setFontColor(.white)

        return view
    }()
    
    var tapGestureAction: ( () -> Void )?

    init(project: Project) {
        super.init(frame: .zero)
        setProject(project)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setProject(_ project: Project) {
        imageView.image = project.image
        progressView.titleLabel.text = project.title

        let progress = project.getValueCollected() / project.goal
        progressView.setProgress(Float(progress))
    }

    func setup() {
        setupImage()
        setupProgressView()

        self.snp.makeConstraints { make in
            make.height.equalTo(112)
        }

        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }

    func setupImage() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupProgressView() {
        let blackLayer = UIView()
        blackLayer.backgroundColor = .black.withAlphaComponent(0.6)

        self.addSubview(blackLayer)
        self.addSubview(progressView)

        progressView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-8)
        }

        blackLayer.snp.makeConstraints { make in
            make.top.equalTo(progressView).offset(-8)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    func setTapGestureToCallAction(_ action: @escaping () -> Void) {
        if tapGestureAction == nil {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(tap)
        }
        self.tapGestureAction = action
    }

    @objc func handleTap() {
        tapGestureAction?()
    }
}

#if DEBUG
import SwiftUI
struct ProjectCardView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                ProjectCardView()
            }

        }.previewLayout(.fixed(width: 400, height: 200))
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = {
                let superView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
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
