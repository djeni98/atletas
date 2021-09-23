//
//  OnboardingCard.swift
//  Atletas
//
//  Created by Giovana Garcia on 22/09/21.
//

import UIKit

class OnboardingCard {
    let image: UIImage?
    let titleText: String
    let subtitleText: String
    
    init(image: UIImage?, titleText: String, subtitleText: String) {
        self.image = image
        self.titleText = titleText
        self.subtitleText = subtitleText
    }
}
