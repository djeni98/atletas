//
//  ProjectViewController.swift
//  Atletas
//
//  Created by André Schueda on 04/09/21.
//

import UIKit

class ProjectViewController: UIViewController {
    lazy var modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(modalView)
        modalView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        // Do any additional setup after loading the view.
    }

}
