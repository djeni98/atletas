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
    var limitDate: Date = Date()
    let sport: SportEnum
    let category: SportCategoryEnum
    var donations: [Donation] = []
   
    init(title: String, image: UIImage, about: String, goal: Double, deadline: String, sport: SportEnum, category: SportCategoryEnum) {
        self.title = title
        self.image = image
        self.about = about
        self.goal = goal
        self.sport = sport
        self.category = category

        if let date = Date.fromDayMonthYear(deadline) {
            self.limitDate = date
            self.deadline = deadline
        } else {
            self.deadline = limitDate.toDayMonthYearString()
        }
    }
    
    func getValueCollected () -> Double {
        return donations.reduce(0, { $0 + ($1.status == .confirmed ? $1.athleteAmount : 0) })
    }

    func getRemainingTimeInString() -> String {
        let today = Date()
        let components = today.getOffsetFrom(date: limitDate)

        var dateArray = [String]()
        var isOnDeadline = true

        let dateDescribers = [("anos", "ano"), ("meses", "mês"), ("dias", "dia")]
        for (index, component) in [components.year, components.month, components.day].enumerated() {
            guard let date = component, date != 0 else { continue }
            isOnDeadline = isOnDeadline && date > 0

            let absoluteDate = date > 0 ? date : -date
            let describer = absoluteDate > 1 ? dateDescribers[index].0 : dateDescribers[index].1
            dateArray.append("\(absoluteDate) " + describer)
        }

        if dateArray.count == 0 { return "Encerrado" }

        var result = dateArray[0]
        if dateArray.count > 1 { result += " e " + dateArray[1] }

        if isOnDeadline { result = result + " restante(s)" }
        else { result = "Encerrado há " + result }
        
        return result
    }
}
