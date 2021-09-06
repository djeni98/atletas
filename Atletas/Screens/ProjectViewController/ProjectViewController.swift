//
//  ProjectViewController.swift
//  Atletas
//
//  Created by André Schueda on 04/09/21.
//

import UIKit

class ProjectViewController: UIViewController {
    lazy var contentView: ProjectContentView = {
        let view = ProjectContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContent()
        setupNav()
    }
    
    func setupContent() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Apoiar"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: nil, action: nil)
    }
    
}
