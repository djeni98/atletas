//
//  ConfirmDonationViewController.swift
//  Atletas
//
//  Created by André Schueda on 09/09/21.
//

import UIKit

class ConfirmDonationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupNav()
    }
    
    func setupNav() {
        navigationItem.title = "Apoiar"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Concluir", style: .plain, target: self, action: #selector(clickedDone))
    }
    
    @objc func clickedDone() {
        
    }
}
