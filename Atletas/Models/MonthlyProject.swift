//
//  MonthlyProject.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 14/09/21.
//
import UIKit

class MonthlyProject: Project {
    init(goal: Double, image: UIImage?, about: String = "", sport: SportEnum, category: SportCategoryEnum) {
        let deadline = Date().endOfMonth().toDayMonthYearString()
        let about = "O Renda Atleta tem como objetivo ser um suporte financeiro mensal para os atletas."
        super.init(
            title: "Renda Atleta", goal: goal, deadline: deadline,
            image: image, about: about, sport: sport, category: category,
            isMonthlyProject: true
        )
    }
}
