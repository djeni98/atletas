//
//  ProjectProgressView.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

class ProjectProgressView: UIView {

    var titleString: String?
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)

        return label
    }()

    var percentageFloat: Float = 1
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right

        let percentage = Int(percentageFloat * 100)
        label.text = "\(percentage)%"

        return label
    }()

    lazy var progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.progressTintColor = UIColor(named: "Blue")

        view.progress = percentageFloat
        view.trackTintColor = UIColor(r: 231, g: 231, b: 231)

        return view
    }()


    init(percentage: Float, title: String? = nil) {
        super.init(frame: .zero)
        percentageFloat = percentage
        titleString = title
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        setupProgress()
        setupPercentage()
        setupTitleIfExists()
        setViewConstraints()
    }

    func setupProgress() {
        self.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.height.equalTo(5)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview().offset(-4)
        }
    }

    func setupPercentage() {
        self.addSubview(percentageLabel)
        percentageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(progressView.snp.top).offset(-4)
            make.trailing.equalTo(progressView)

            make.width.equalTo(64)
        }
    }

    func setupTitleIfExists() {
        guard let title = titleString else { return }

        titleLabel.text = title
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(percentageLabel)
            make.leading.equalTo(progressView)
            make.trailing.equalTo(percentageLabel.snp.leading)
        }
    }

    func setViewConstraints() {
        let topConstraint = titleString != nil ? titleLabel : percentageLabel

        self.snp.makeConstraints { make in
            make.top.equalTo(topConstraint)
        }
    }

    func setProgress(_ newValue: Float) {
        percentageFloat = newValue
        progressView.progress = newValue

        let percentage = Int(newValue * 100)
        percentageLabel.text = "\(percentage)%"
    }

    func setFontColor(_ color: UIColor?) {
        titleLabel.textColor = color
        percentageLabel.textColor = color
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        progressView.subviews.forEach { subview in
            subview.layer.masksToBounds = true
            subview.layer.cornerRadius = 3
        }
    }
}


#if DEBUG
import SwiftUI
struct ProjectProgressView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                ProjectProgressView(percentage: 0.5)
            }

            ContentView {
                ProjectProgressView(percentage: 1, title: "Algum Título")
            }
        }.previewLayout(.fixed(width: 400, height: 80))
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = {
                let superView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 80))
                let view = viewBuilder()

                superView.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = true
                view.snp.makeConstraints { make in
                    make.bottom.equalToSuperview()
                    make.leading.equalToSuperview()
                    make.trailing.equalToSuperview()
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
