//
//  AccountHeaderView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 05/09/21.
//

import UIKit

class AccountHeaderView: UIView {
    let imageSize: CGFloat = 56
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageSize / 2
        imageView.image = UIImage(named: "???")!
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        label.textColor = UIColor(named: "PrimaryFont")

        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "SecondaryFont")
        label.text = "Veja seu perfil"

        return label
    }()

    lazy var chevronImage: UIImageView = {
        let config = UIImage.SymbolConfiguration(pointSize: 16)
        let image = UIImage(systemName: "chevron.right", withConfiguration: config)
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(r: 169, g: 169, b: 169)

        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    var tapGestureAction: ( () -> Void )?

    init(title: String, subtitle: String, image: UIImage?) {
        super.init(frame: .zero)
        setup(title: title, subtitle: subtitle, image: image)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(title: "Mayra", subtitle: "Veja seu perfil", image: UIImage(named: "???")!)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(title: String, subtitle: String, image: UIImage?) {
        setupImage(withImage: image)
        setupChevron()
        setupTitle(withText: title)
        setupSubtitle(withText: subtitle)

        self.snp.makeConstraints { make in
            make.bottom.equalTo(imageView)
        }
    }

    func setupImage(withImage image: UIImage?) {
        imageView.image = image
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()

            make.width.equalTo(imageSize)
            make.height.equalTo(imageSize)
        }
    }

    func setupChevron() {
        self.addSubview(chevronImage)
        chevronImage.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.trailing.equalToSuperview().offset(-4)
        }
    }

    func setupTitle(withText text: String) {
        titleLabel.text = text
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.bottom.equalTo(imageView.snp.centerY)

            make.leading.equalTo(imageView.snp.trailing).offset(12)
            make.trailing.equalTo(chevronImage.snp.leading).offset(-12)
        }
    }

    func setupSubtitle(withText text: String) {
        subtitleLabel.text = text
        self.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.centerY)
            make.bottom.equalToSuperview().offset(-4)

            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
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
struct AccountHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                AccountHeaderView()
            }
        }.previewLayout(.fixed(width: 400, height: 150))
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = {
                let superView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 150))
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
