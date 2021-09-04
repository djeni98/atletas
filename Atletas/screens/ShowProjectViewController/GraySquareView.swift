//
//  GraySquareView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

class GraySquareView: UIView {
    lazy var goalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.text = "Meta"

        return label
    }()

    lazy var calendarImage: UIImageView = {
        let config = UIImage.SymbolConfiguration(pointSize: 16)
        let image = UIImage(systemName: "calendar", withConfiguration: config)
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor.label

        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    var valueString = "R$ 0.000,00"
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = valueString
        return label
    }()

    let constraintOffset = 16

    enum TypeOfSquare {
        case goal, deadline
    }

    init(value: String, type: TypeOfSquare) {
        super.init(frame: .zero)
        let view: UIView = type == .goal ? goalLabel : calendarImage

        valueString = value
        setup(descriptionView: view)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(descriptionView: goalLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(descriptionView: UIView) {
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 10
        setupDescription(withView: descriptionView)
        setupValueLabel(withUpperView: descriptionView)
    }

    func setupDescription(withView view: UIView) {
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(constraintOffset)
            make.centerX.equalToSuperview()
        }
    }

    func setupValueLabel(withUpperView view: UIView) {
        self.addSubview(valueLabel)
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-constraintOffset)
        }
    }

    func setValue(withText text: String) {
        valueString = text
        valueLabel.text = text
    }
}


#if DEBUG
import SwiftUI
struct GraySquareView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                GraySquareView(value: "R$ 3.500,00", type: .goal)
            }
            ContentView {
                GraySquareView(value: "05/09/2021", type: .deadline)
            }
        }.previewLayout(.fixed(width: 200, height: 150))
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = {
                let superView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
                let view = viewBuilder()

                superView.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = true
                view.snp.makeConstraints { make in
                    make.centerY.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.width.equalTo(150)
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
