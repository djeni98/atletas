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
    var goal: Double
    var deadline: String
    var limitDate: Date = Date()

    var image: UIImage?
    var about: String

    let sport: SportEnum
    let category: SportCategoryEnum
    var donations: [Donation] = []

    weak var athlete: Athlete?
   
    init(title: String, goal: Double, deadline: String, image: UIImage?, about: String = "", sport: SportEnum, category: SportCategoryEnum) {
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

    func clone() -> Project {
        let p = clone(withDonations: [])
        p.donations = donations.map { $0.clone() }

        return p
    }

    func clone(withDonations donations: [Donation]) -> Project {
        let p = Project(title: title, goal: goal, deadline: deadline, image: image, about: about, sport: sport, category: category)
        p.athlete = athlete
        p.donations = donations

        return p
    }

    func getDescription() -> String {
        let percentage = Int(getValueCollected() / goal * 100)
        return "Finaliza no dia \(deadline) - \(percentage)% concluído"
    }
    
    func getValueCollected () -> Double {
        return donations.reduce(0, { $0 + ($1.status == .confirmed ? $1.athleteAmount : 0) })
    }

    func getProgress() -> Double {
        return getValueCollected() / goal
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
