//
//  PixCodeView.swift
//  Atletas
//
//  Created by André Schueda on 08/09/21.
//

import UIKit

class PixCodeView: UIView {
    let cornerRadius: CGFloat = 7
    let dashWidth: CGFloat = 1
    let dashColor: UIColor = UIColor(named: "dashedBorder") ?? .black
    let dashLength: CGFloat = 3
    let betweenDashSpace: CGFloat = 3
    
    var dashBorder: CAShapeLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dashBorder?.removeFromSuperlayer()
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = dashColor.cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashSpace] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        dashBorder.path = cornerRadius > 0 ? UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath : UIBezierPath(rect: bounds).cgPath
        layer.addSublayer(dashBorder)
        self.dashBorder = dashBorder
    }
    
    lazy var pixCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "000.000.000-99"
        label.font = UIFont.preferredFont(for: .headline, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor(named: "pixCode")
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init well")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPixCodeLabel()
    }
    
    func setupPixCodeLabel() {
        addSubview(pixCodeLabel)
        pixCodeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}
