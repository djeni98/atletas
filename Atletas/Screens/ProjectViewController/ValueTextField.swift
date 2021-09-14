//
//  ValueTextField.swift
//  Atletas
//
//  Created by André Schueda on 09/09/21.
//

import UIKit

class ValueTextField: UITextField {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
                return false
        }
}
