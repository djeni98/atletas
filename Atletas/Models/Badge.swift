//
//  Badge.swift
//  Atletas
//
//  Created by André Schueda on 26/08/21.
//

import UIKit

class Badge {
    let title: String
    let image: UIImage
    let shortDescription: String
    let detailedDescription: String
    let objectName: String
    var sceneName: String {
        "3dModels.scnassets/\(objectName)/\(objectName).scn"
    }
    
    init(title: String, image: UIImage, shortDescription: String, detailedDescription: String, objectName: String) {
        self.title = title
        self.image = image
        self.objectName = objectName
        self.shortDescription = shortDescription
        self.detailedDescription = detailedDescription
    }
}
