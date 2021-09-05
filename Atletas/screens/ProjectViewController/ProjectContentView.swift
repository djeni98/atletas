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
    
    required init?(coder: NSCoder) {
        fatalError("abuble")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(175)
        }
    }

}
