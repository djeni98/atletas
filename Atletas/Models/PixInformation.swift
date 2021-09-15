//
//  PixInformation.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 13/09/21.
//

class PixInformation {
    var key: String
    var cpf: String
    var bank: String

    init(key: String, cpf: String, bank: String) {
        self.key = key
        self.cpf = cpf
        self.bank = bank
    }

    func getMaskedCpf() -> String {
        let numbersArray = cpf.filter("0123456789".contains)

        let maskedArray = numbersArray.enumerated().reduce("") { string, enumeratedItem in
            let (index, char) = enumeratedItem

            var addChar = String(char)
            if (0..<3).contains(index) || (6...).contains(index) {
                addChar = "*"
            }

            var separator = [2, 5].contains(index) ? "." : ""
            separator = index == 8 ? "-" : separator

            return string + addChar + separator
        }

        return maskedArray
    }
}
