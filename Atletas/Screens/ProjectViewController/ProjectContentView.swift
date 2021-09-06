//
//  ProjectContentView.swift
//  Atletas
//
//  Created by André Schueda on 05/09/21.
//

import UIKit

class ProjectContentView: UIView {

    lazy var imageView: ProjectImageView = {
        let view = ProjectImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var infoView: SupportedInfoView = {
        let view = SupportedInfoView()
        view.layer.borderColor = UIColor(named: "ButtonGreen")?.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init well")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupImageView()
        setupInfoView()
    }

    func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(UIScreen.main.bounds.size.height * 0.20)
        }
    }
    
    func setupInfoView() {
        addSubview(infoView)
        infoView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
