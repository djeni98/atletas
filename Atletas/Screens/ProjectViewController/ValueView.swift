//
//  ValueView.swift
//  Atletas
//
//  Created by André Schueda on 07/09/21.
//

import UIKit

class ValueView: UIView {

    lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Copie o código abaixo e utilize o Pix Copia e Cola no aplicativo que você vai fazer o pagamento:"
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init well")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInstructionLabel()
    }
    
    func setupInstructionLabel() {
        addSubview(instructionLabel)
        instructionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
        }
    }
}
