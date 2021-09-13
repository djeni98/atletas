//
//  ConfirmDonationViewController.swift
//  Atletas
//
//  Created by André Schueda on 09/09/21.
//

import UIKit

class ConfirmDonationViewController: UIViewController {
    let donationRepository: DonationRepository = fakeDonationRepository()
    var donationValue: Double?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollContentView: ConfirmDonationContentView = {
        let view = ConfirmDonationContentView()
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
        scrollContentView.navigationController = self.navigationController
        scrollContentView.donationValue = self.donationValue
    }
    
    func setupNav() {
        navigationItem.title = "Apoiar"
    }
}
