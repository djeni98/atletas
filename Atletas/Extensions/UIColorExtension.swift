//
//  UIColorExtension.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1) {
        let redPart: CGFloat = CGFloat(r) / 255
        let greenPart: CGFloat = CGFloat(g) / 255
        let bluePart: CGFloat = CGFloat(b) / 255

        self.init(red: redPart, green: greenPart, blue: bluePart, alpha: a)
    }
}
