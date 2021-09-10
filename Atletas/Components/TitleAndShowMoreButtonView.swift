//
//  TitleAndShowMoreButtonView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 06/09/21.
//

import UIKit

class TitleAndShowMoreButtonView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        label.textColor = UIColor(named: "PrimaryFont")

        return label
    }()

    lazy var showMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Mostrar mais", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()

    init(title: String, showMoreAction: @escaping () -> Void) {
        super.init(frame: .zero)
        setup(title: title, showMoreAction: showMoreAction)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(title: "Title not defined", showMoreAction: {})
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(title: String, showMoreAction: @escaping () -> Void) {
        setupTitle(withText: title)
        setupShowMoreButton(action: showMoreAction)
    }

    func setTitle(withText text: String) {
        titleLabel.text = text
    }

    func setupTitle(withText text: String) {
        titleLabel.text = text
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }

    func setShowMoreAction(with action: @escaping () -> Void) {
        let uiAction = UIAction() { _ in action() }
        showMoreButton.addAction(uiAction, for: .primaryActionTriggered)
    }

    func setupShowMoreButton(action: @escaping () -> Void) {
        let uiAction = UIAction() { _ in action() }
        showMoreButton.addAction(uiAction, for: .primaryActionTriggered)

        self.addSubview(showMoreButton)
        showMoreButton.snp.makeConstraints { make in
            make.lastBaseline.equalTo(titleLabel)

            make.leading.equalTo(titleLabel.snp.trailing)
            make.trailing.equalToSuperview()
        }
    }
}

#if DEBUG
import SwiftUI
struct TitleAndShowMoreButtonView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                TitleAndShowMoreButtonView()
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
