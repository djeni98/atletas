//
//  Badge.swift
//  Atletas
//
//  Created by André Schueda on 26/08/21.
//

import Foundation

class Badge {
    let title: String
    let imageName: String
    let shortDescription: String
    let detailedDescription: String
    let toAchieveDescription: String
    let objectName: String
    var sceneName: String {
        "3dModels.scnassets/\(objectName)/\(objectName).scn"
    }
    
    init(title: String, imageName: String, shortDescription: String, detailedDescription: String, objectName: String, toAchieveDescription: String) {
        self.title = title
        self.imageName = imageName
        self.objectName = objectName
        self.shortDescription = shortDescription
        self.detailedDescription = detailedDescription
        self.toAchieveDescription = toAchieveDescription
    }
}
