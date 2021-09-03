//
//  Sport.swift
//  Sport
//
//  Created by Guilerme Barciki on 26/08/21.
//

import Foundation
import UIKit

class Sport {
    let sport: SportEnum
    let sportImage: UIImage
    
    init(sport: SportEnum, sportImage: UIImage){
        self.sport = sport
        self.sportImage = sportImage
    }
}
