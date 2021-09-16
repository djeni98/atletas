//
//  SportCategoryEnum.swift
//  Atletas
//
//  Created by André Schueda on 26/08/21.
//

import Foundation

enum SportCategoryEnum {
    case amateur
    case olympic
    case base
    case brazilianTeam

    func getName() -> String {
        switch self {
        case .amateur: return "Amador"
        case .olympic: return "Olímpico"
        case .base: return "Categoria de Base"
        case .brazilianTeam: return "Seleção Brasileira"
        }
    }
}
