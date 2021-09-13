//
//  SupporterAccountViewController.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class SupporterAccountViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var scrollViewContent: SupporterAccountContentView = {
        let stackView = SupporterAccountContentView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupContent()
        navigationController?.navigationBar.isHidden = true
    }
    

    func setupContent() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(scrollViewContent)
        scrollViewContent.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0))
            make.width.equalTo(scrollView)
        }
    }

}
