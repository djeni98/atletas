//
//  ArrayExtension.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 06/09/21.
//

import Foundation

extension Array {
    func slice(_ range: Range<Int>) -> Array {
        let sliced = self.count < range.endIndex ? self[0..<self.count] : self[range]
        return Array(sliced)
    }
}
