//
//  ShowMoreDonationsSectionView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 06/09/21.
//

import UIKit

class ShowMoreDonationsSectionView: UIView {
    let headerView: TitleAndShowMoreButtonView = {
        let view = TitleAndShowMoreButtonView()
        view.setTitle(withText: "Doações Recentes")
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8

        return view
    }()

    init(donations: [Donation], showMoreAction: @escaping () -> Void) {
        super.init(frame: .zero)
        setup(donations: donations, showMoreAction: showMoreAction)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let donations: [Donation] = Array(1...3).map { n in
            return Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .pending, project: "Renda Atleta")
        }
        setup(donations: donations, showMoreAction: {})
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(donations: [Donation], showMoreAction: @escaping () -> Void) {
        setupHeader(withAction: showMoreAction)
        setupStackView(withDonations: donations)

        self.snp.makeConstraints { make in
            make.bottom.equalTo(stackView)
        }
    }

    func setupHeader(withAction action: @escaping () -> Void) {
        headerView.setShowMoreAction(with: action)

        self.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    func setDonations(_ donations: [Donation]) {
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        donations.forEach { donation in
            let donationCell = DonationCell()
            donationCell.data = donation

            stackView.addArrangedSubview(donationCell.donationView)
        }
    }

    func setupStackView(withDonations donations: [Donation]) {
        self.addSubview(stackView)

        setDonations(donations)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(12)

            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}

#if DEBUG
import SwiftUI
struct ShowMoreDonationsSectionView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                ShowMoreDonationsSectionView()
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
