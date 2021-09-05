//
//  AboutView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

class AboutView: UIView {
    let fontColor = UIColor(named: "SecondaryFont")
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = fontColor
        label.text = "Sobre"

        return label
    }()

    lazy var aboutTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = fontColor

        return label
    }()

    init(aboutText: String) {
        super.init(frame: .zero)
        setup(aboutText: aboutText)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let largeText = Array(1...200).reduce("", { $0 + "\($1)"})
        setup(aboutText: largeText)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(aboutText: String) {
        setupTitle()
        setupAboutTextLabel(withText: aboutText)

        self.snp.makeConstraints { make in
            make.bottom.equalTo(aboutTextLabel)
        }
    }

    func setupTitle() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }

    func setupAboutTextLabel(withText text: String) {
        aboutTextLabel.text = text
        aboutTextLabel.numberOfLines = 0

        self.addSubview(aboutTextLabel)
        aboutTextLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

}

#if DEBUG
import SwiftUI
struct AboutView_Preview: PreviewProvider {

    static var previews: some View {
        Group {
            ContentView {
                AboutView()
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
