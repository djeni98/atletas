//
//  Sport.swift
//  Sport
//
//  Created by Guilerme Barciki on 26/08/21.
//

import Foundation
import UIKit

class Sport: Supportable {
    var image: UIImage?
    var text: String
    
    let sport: SportEnum
    let sportImage: UIImage
    let headerImage: UIImage
    
    init(sport: SportEnum, sportImage: UIImage, headerImage: UIImage){
        self.sport = sport
        self.sportImage = sportImage
        self.headerImage = headerImage
        
        self.image = sportImage
        self.text = sport.rawValue
    }
}
