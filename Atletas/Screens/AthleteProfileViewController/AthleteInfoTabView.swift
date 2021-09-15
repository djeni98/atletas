//
//  AthleteInfoTabView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 08/09/21.
//

import UIKit

class AthleteInfoTabView: UIView {
    var athlete: Athlete? {
        didSet {
            guard let athlete = athlete else { return }

            descriptionLabelView.text = athlete.getDescription()
            cityLabelView.text = athlete.city

            instagramLabelView.text = athlete.socialMedia.instagram
            facebookLabelView.text = athlete.socialMedia.facebook
            twitterLabelView.text = athlete.socialMedia.twitter

            phoneLabelView.text = athlete.getPhone()
            emailLabelView.text = athlete.getEmail()
        }
    }
    

    // ----- Details -----
    lazy var detailsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var descriptionLabelView: IconAndLabelView = {
        let labelView = IconAndLabelView()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.image = UIImage(named: "atleta_icon")

        return labelView
    }()

    lazy var cityLabelView: IconAndLabelView = {
        let labelView = IconAndLabelView()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.image = UIImage(systemName: "house.circle.fill")

        return labelView
    }()

    // ----- Social Media -----
    lazy var socialMediaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var instagramLabelView: IconAndLabelView = {
        let labelView = IconAndLabelView()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.image = UIImage(named: "insta_icon")

        return labelView
    }()

    lazy var facebookLabelView: IconAndLabelView = {
        let labelView = IconAndLabelView()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.image = UIImage(named: "facebook_icon")

        return labelView
    }()

    lazy var twitterLabelView: IconAndLabelView = {
        let labelView = IconAndLabelView()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.image = UIImage(named: "twitter_icon")

        return labelView
    }()

    // ----- Contact Info -----
    lazy var contactInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var phoneLabelView: IconAndLabelView = {
        let labelView = IconAndLabelView()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.image = UIImage(named: "phone_icon")

        return labelView
    }()

    lazy var emailLabelView: IconAndLabelView = {
        let labelView = IconAndLabelView()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.image = UIImage(named: "mail_icon")

        return labelView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        let detailsItems = [descriptionLabelView, cityLabelView]
        setupSection(view: detailsView, title: "Detalhes", items: detailsItems)
        detailsView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
        }

        let firstSeparator = addSeparator(to: self, withPreviousView: detailsView)
        let socialMediaItems = [instagramLabelView, facebookLabelView, twitterLabelView]
        setupSection(view: socialMediaView, title: "Redes Sociais", items: socialMediaItems)
        socialMediaView.snp.makeConstraints { make in
            make.top.equalTo(firstSeparator.snp.bottom).offset(16)
        }

        let secondSeparator = addSeparator(to: self, withPreviousView: socialMediaView)
        let contactItems = [phoneLabelView, emailLabelView]
        setupSection(view: contactInfoView, title: "Informações de Contato", items: contactItems)
        contactInfoView.snp.makeConstraints { make in
            make.top.equalTo(secondSeparator.snp.bottom).offset(16)
        }

        self.snp.makeConstraints { make in
            make.bottom.equalTo(contactInfoView)
        }
    }

    func getSectionLabel(text: String) -> UILabel {
        let sectionLabel = UILabel()
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        sectionLabel.textColor = UIColor(named: "PrimaryFont")
        sectionLabel.text = text

        return sectionLabel
    }

    func getStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        return stackView
    }

    func addSeparator(to view: UIView, withPreviousView previous: UIView) -> UIView {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor(r: 198, g: 198, b: 198)

        view.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(previous.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }

        return separator
    }

    func setupSection(view: UIView, title: String, items: [IconAndLabelView]) {
        self.addSubview(view)

        let sectionLabel = getSectionLabel(text: title)
        view.addSubview(sectionLabel)

        let stackView = getStackView()
        view.addSubview(stackView)

        sectionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(sectionLabel.snp.bottom).offset(12)

            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        items.forEach { item in
            stackView.addArrangedSubview(item)
        }

        view.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalTo(stackView)
        }

    }
}


#if DEBUG
import SwiftUI
struct AthleteInfoTabView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                let view = AthleteInfoTabView()

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
