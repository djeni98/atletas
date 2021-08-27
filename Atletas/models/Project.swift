//
//  Project.swift
//  Project
//
//  Created by Guilerme Barciki on 26/08/21.
//

import Foundation
import UIKit

class Project {
    var title: String
    var image: UIImage
    var about: String
    var deadLine: String
    let sportName: SportEnum
    let category: String // ou enum??
    var donations: [Donation]
   
    init(title: String, image: UIImage, about: String, deadLine: String, sportName: SportEnum, category: String, donations: [Donation]) {
        self.title = title
        self.image = image
        self.about = about
        self.deadLine = deadLine
        self.sportName = sportName
        self.category = category
        self.donations = donations
    }
    
    func getValueCollected () {
        
    }
    


}
