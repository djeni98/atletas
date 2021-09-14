//
//  SupporterAccountViewController.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class SupporterAccountViewController: UIViewController {
    lazy var supporter: Supporter = {
        let supporter = Supporter(name: "André Schueda", username: "schueda__", password: "******")
        supporter.level = .diamond
        supporter.donations = [Donation(receiptImage: UIImage(), supporter: supporter.name, supporterAmount: 35, athleteAmount: 35, status: .confirmed, project: "Sul-Americano 2022"), Donation(receiptImage: UIImage(), supporter: supporter.name, supporterAmount: 50, athleteAmount: 50, status: .pending, project: "Renda Atleta"), Donation(receiptImage: UIImage(), supporter: supporter.name, supporterAmount: 60, athleteAmount: 60, status: .rejected, project: "Novos Equipamentos")]
        return supporter
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var scrollViewContent: SupporterAccountContentView = {
        let view = SupporterAccountContentView(supporter: supporter)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")

        setupContent()
        navigationController?.navigationBar.isHidden = true
        
    }
    

    func setupContent() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(scrollViewContent)
        scrollViewContent.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 32, left: 0, bottom: 32, right: 0))
            make.width.equalTo(scrollView)
        }
        scrollViewContent.supporter = self.supporter
    }
}
