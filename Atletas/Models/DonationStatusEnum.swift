//
//  DonationStatusEnum.swift
//  DonationStatusEnum
//
//  Created by Guilerme Barciki on 26/08/21.
//

import Foundation

enum DonationStatusEnum: CaseIterable, Comparable {
    case pending, confirmed, rejected

    private var comparisonValue: Int {
        switch self {
        case .pending: return 1
        case .confirmed: return 2
        case .rejected: return 3
        }
    }

    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.comparisonValue < rhs.comparisonValue
    }
}
