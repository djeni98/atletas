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
//        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var scrollViewContent: SupporterAccountContentView = {
        let stackView = SupporterAccountContentView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
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
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 32, left: 0, bottom: 32, right: 0))
            make.width.equalTo(scrollView)
        }
    }
}

//extension SupporterAccountViewController: UIScrollViewDelegate {
//    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
//        navigationController?.navigationBar.isHidden = true
//    }
//
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        navigationController?.navigationBar.isHidden = false
//    }
//}
