//
//  IconAndLabelView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 08/09/21.
//

import UIKit

class IconAndLabelView: UIView {
    var text: String? {
        didSet {
            label.text = text
        }
    }

    var image: UIImage? {
        didSet {
            iconImageView.image = image
        }
    }

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(named: "PrimaryFont")
        imageView.image = UIImage(systemName: "circle.fill")

        return imageView
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "PrimaryFont")
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.text = "Label"

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.addSubview(iconImageView)
        self.addSubview(label)

        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.leading.equalToSuperview()
            make.firstBaseline.equalTo(label)
        }

        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview()
        }

        self.snp.makeConstraints { make in
            make.bottom.equalTo(label)
        }
    }
}

#if DEBUG
import SwiftUI
struct IconAndLabelView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                let view = IconAndLabelView()

                return view
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
