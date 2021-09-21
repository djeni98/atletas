//
//  OnboardingViewController.swift
//  Atletas
//
//  Created by Giovana Garcia on 21/09/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    lazy var onboardingContentView: OnboardingContentView = {
        let view = OnboardingContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContentView()
    }
    
    func setupContentView() {
        view.addSubview(onboardingContentView)
        onboardingContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
