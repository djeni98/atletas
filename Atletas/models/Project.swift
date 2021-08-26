//
//  Project.swift
//  Project
//
//  Created by Guilerme Barciki on 26/08/21.
//

import Foundation
import UIKit

class Project {
    let title: String
    let image: UIImage
    let about: String
    let deadLine: String
    let sportName: SportList
    let category: String // ou enum??
    let donations: [Donation]
   
    init(title: String, image: UIImage, about: String, deadLine: String, sportName: SportList, category: String, donations: [Donation]) {
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
