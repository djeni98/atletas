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
    var goal: Double
    var deadline: String
    let sport: SportEnum
    let category: SportCategoryEnum
    var donations: [Donation] = []
   
    init(title: String, image: UIImage, about: String, goal: Double, deadline: String, sport: SportEnum, category: SportCategoryEnum) {
        self.title = title
        self.image = image
        self.about = about
        self.goal = goal
        self.deadline = deadline
        self.sport = sport
        self.category = category
    }
    
    func getValueCollected () {}
}
