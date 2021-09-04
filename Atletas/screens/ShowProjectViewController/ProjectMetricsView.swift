//
//  ProjectMetricsView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

class ProjectMetricsView: UIView {
    lazy var collectedValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .label

        return label
    }()

    lazy var progressView: ProjectProgressView = {
        let view = ProjectProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var goalSquareView: GraySquareView = {
        let view = GraySquareView(value: "R$ 0.000,00", type: .goal)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var deadlineSquareView: GraySquareView = {
        let view = GraySquareView(value: "00/00/0000", type: .deadline)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    init(collectedValue: Double, goalValue: Double, deadline: String) {
        super.init(frame: .zero)
        setup(collectedValue: collectedValue, goalValue: goalValue, deadline: deadline)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(collectedValue: 2675.00, goalValue: 3500.00, deadline: "05/09/2021")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(collectedValue: Double, goalValue: Double, deadline: String) {
        setupCollectedValue(withValue: collectedValue)
        setupProgress(withValue: collectedValue / goalValue)
        setupGoalView(withValue: goalValue)
        setupDeadlineView(withValue: deadline)

        self.snp.makeConstraints { make in
            make.bottom.equalTo(deadlineSquareView)
        }
    }

    func getCurrency(withValue value: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale(identifier: "pt_BR")

        let defaultString = "R$ " + String.init(format: "%.2f", value)
        let priceString = currencyFormatter.string(from: NSNumber(value: value)) ?? defaultString

        return priceString
    }

    func setupCollectedValue(withValue value: Double) {
        let statusLabel = UILabel()
        statusLabel.textColor = .label
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Arrecadado"

        collectedValueLabel.text = getCurrency(withValue: value)

        self.addSubview(statusLabel)
        self.addSubview(collectedValueLabel)

        statusLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(32)
        }

        collectedValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(statusLabel.snp.bottom).offset(4)
        }
    }

    func setupProgress(withValue value: Double) {
        progressView.setProgress(Float(value))
        self.addSubview(progressView)

        progressView.snp.makeConstraints { make in
            make.top.equalTo(collectedValueLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    func setupGoalView(withValue value: Double) {
        goalSquareView.setValue(withText: getCurrency(withValue:value))
        self.addSubview(goalSquareView)
        goalSquareView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(16)
            make.leading.equalTo(progressView)
            make.width.equalTo(progressView).dividedBy(2).offset(-5)
        }
    }

    func setupDeadlineView(withValue value: String) {
        deadlineSquareView.setValue(withText: value)
        self.addSubview(deadlineSquareView)
        deadlineSquareView.snp.makeConstraints { make in
            make.top.equalTo(goalSquareView)
            make.leading.equalTo(goalSquareView.snp.trailing).offset(10)
            make.trailing.equalTo(progressView)
        }
    }
}
