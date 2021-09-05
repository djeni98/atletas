//
//  ImageAndTitleView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

class ImageAndTitleView: UIView {
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown

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

    init(title: String, subtitle: String, image: UIImage? = nil) {
        super.init(frame: .zero)
        setup(title: title, subtitle: subtitle, image: image)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(title: "Sul Americano 2022", subtitle: "12 dias restantes")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(title: String, subtitle: String, image: UIImage? = nil) {
        setupImage(withImage: image)
        setupTitle(withText: title)
        setupSubtitle(withText: subtitle)
    }

    func setImage(withImage image: UIImage?) {
        imageView.image = image
    }

    func setupImage(withImage image: UIImage?) {
        imageView.image = image
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }

        self.snp.makeConstraints { make in
            make.bottom.equalTo(imageView)
        }
    }

    func setTitle(withText text: String) {
        titleLabel.text = text
    }

    func setupTitle(withText text: String) {
        titleLabel.text = text
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(16)
            make.leading.equalTo(imageView).offset(16)
            make.trailing.equalTo(imageView).offset(-16)
        }

    }

    func setSubtitle(withText text: String) {
        subtitleLabel.text = text
    }

    func setupSubtitle(withText text: String) {
        subtitleLabel.text = text
        self.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
        }
    }
}

#if DEBUG
import SwiftUI
struct ImageAndTitleView_Preview: PreviewProvider {

    static var previews: some View {
        Group {
            ContentView {
                ImageAndTitleView()
            }
        }.previewLayout(.fixed(width: 400, height: 400))
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = {
                let superView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
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
