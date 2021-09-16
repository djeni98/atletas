//
//  DictionaryExtension.swift
//  Atletas
//
//  Created by André Schueda on 15/09/21.
//

import Foundation

extension Dictionary {
    subscript(i:Int) -> (key:Key, value:Value) {
        get {
            return self[index(startIndex, offsetBy: i)]
        }
    }
}
