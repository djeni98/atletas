//
//  ShowDonationViewController.swift
//  Atletas
//
//  Created by André Schueda on 14/09/21.
//

import UIKit

class ShowDonationViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var scrollContentView: ShowDonationContentView = {
        let view = ShowDonationContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        
        scrollView.addSubview(scrollContentView)
        scrollContentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0))
            make.width.equalTo(scrollView)
        }
    }
    
    func setupNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Donation Title"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: nil, action: nil)
    }
    
    @objc func cancelClicked() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
