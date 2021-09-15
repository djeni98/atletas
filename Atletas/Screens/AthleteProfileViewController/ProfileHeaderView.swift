//
//  ProfileHeaderView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 07/09/21.
//

import UIKit

class ProfileHeaderView: UIView {
    var athlete: Athlete? {
        didSet {
            guard let athlete = athlete else { return }

            imageView.image = athlete.image
            titleLabel.text = athlete.name
            subtitleLabel.text = athlete.getDescription()
            backgroundImageView.image = athlete.sport.getHeaderImage()
        }
    }
    
    let imageSize: CGFloat = 126

    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray2
        
        return imageView
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageSize / 2
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()

    init(title: String, subtitle: String, image: UIImage?) {
        super.init(frame: .zero)
        setup(title: title, subtitle: subtitle, image: image)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(title: "Mayra Sayumi", subtitle: "Atleta da Seleção Brasileira de Softbol", image: UIImage(named: "???")!)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(title: String, subtitle: String, image: UIImage?) {
        setupBackground()
        setupImage(withImage: image)
        setupSubtitle(withText: subtitle)
        setupTitle(withText: title)

        self.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundImageView)
        }
    }

    func setupBackground() {
        self.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(215)
            make.width.equalToSuperview()
        }

        let blackLayer = UIView()
        blackLayer.backgroundColor = UIColor(r: 1, g: 1, b: 1, a: 0.4)
        self.addSubview(blackLayer)
        blackLayer.snp.makeConstraints { make in
            make.edges.equalTo(backgroundImageView)
        }
    }

    func setupImage(withImage image: UIImage?) {
        imageView.image = image
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageSize)
            make.width.equalTo(imageSize)

            make.bottom.equalToSuperview().offset(-12)
            make.trailing.equalToSuperview().offset(-32)
        }
    }

    func setupTitle(withText text: String) {
        titleLabel.text = text
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-4)

            make.leading.equalTo(subtitleLabel)
            make.trailing.equalTo(subtitleLabel)
        }
    }

    func setupSubtitle(withText text: String) {
        subtitleLabel.text = text
        self.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imageView).offset(-12)

            make.leading.equalToSuperview().offset(32)
            make.trailing.equalTo(imageView.snp.leading).offset(-12)
        }
    }
}

#if DEBUG
import SwiftUI
struct ProfileHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                ProfileHeaderView()
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
