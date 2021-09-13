//
//  ProjectViewController.swift
//  Atletas
//
//  Created by André Schueda on 04/09/21.
//

import UIKit

class ProjectViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()
    
    lazy var scrollViewContainer: ProjectContentView = {
        let container = ProjectContentView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.axis = .vertical
        container.alignment = .center
        container.spacing = 32
        container.nav = navigationController
        
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "background")
        setupContent()
        setupNav()
    }
    
    func setupContent() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0))
            make.width.equalTo(scrollView)
        }
    }
    
    func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonTitle = "Voltar"
        navigationItem.title = "Apoiar"
        // navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(clickedCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: nil, action: nil)
    }
    
    @objc func clickedCancel() {
        navigationController?.popViewController(animated: true)
    }
}
