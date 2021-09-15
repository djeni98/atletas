//
//  TabBarAndSupportButtonView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 08/09/21.
//

import UIKit

class TabBarAndSupportButtonView: UIView {

    lazy var tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.isTranslucent = false
        tabBar.clipsToBounds = true
        tabBar.tintColor = UIColor(named: "PrimaryFont")
        tabBar.barTintColor = UIColor(named: "background")

        let fontAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        let support = UITabBarItem(
            title: "Apoio",
            image: UIImage(systemName: "brazilianrealsign.circle.fill"),
            tag: 0
        )
        // support.setTitleTextAttributes(fontAttributes, for: .normal)

        let info = UITabBarItem(
            title: "Info",
            image: UIImage(systemName: "person.fill"),
            tag: 1
        )
        // info.setTitleTextAttributes(fontAttributes, for: .normal)

        let items = [support, info]
        tabBar.setItems(items, animated: false)
        tabBar.selectedItem = items[0]

        return tabBar
    }()

    lazy var supportButton: GreenRoundedButton = {
        let button = GreenRoundedButton.getSupportButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.addSubview(supportButton)
        supportButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()

            make.trailing.equalToSuperview().offset(-32)
        }

        self.addSubview(tabBar)
        tabBar.snp.makeConstraints { make in
            make.top.equalToSuperview()

            make.leading.equalToSuperview().offset(32)
            make.trailing.equalTo(supportButton.snp.leading).offset(-16)
        }
    }

    func setSupportButtonAction(_ action: @escaping () -> Void) {
        let uiAction = UIAction() { _ in action() }
        supportButton.addAction(uiAction, for: .primaryActionTriggered)
    }
}

#if DEBUG
import SwiftUI
struct TabBarAndSupportButtonView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                TabBarAndSupportButtonView()
            }
        }.previewLayout(.fixed(width: 400, height: 300))
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = {
                let superView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
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
