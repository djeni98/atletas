//
//  PixCodeView.swift
//  Atletas
//
//  Created by André Schueda on 08/09/21.
//

import UIKit

class PixCodeView: UIView {
    var pixCode: String? {
        didSet {
            pixCodeLabel.text = pixCode
        }
    }
    
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor(named: "pixCode")
        return label
    }()
    
    lazy var copyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clickedCopy), for: .touchUpInside)
        return button
    }()
    
    @objc func clickedCopy() {
        UIPasteboard.general.string = pixCode
        UIView.animate(withDuration: 0.5, animations: {
            self.feedbackLabel.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 2, animations: {
                self.feedbackLabel.alpha = 0.0
            })
        }
    }
    
    lazy var feedbackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Copiado para área de transferência"
        label.alpha = 0
        label.textAlignment = .center
        label.layer.cornerRadius = 7
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(named: "background")
        return label
    }()
    
    
    lazy var copyButtonContentView: CopyButtonContentView = {
        let view = CopyButtonContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init well")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPixCodeLabel()
        setupCopyButton()
        setupFeedbackLabel()
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
    
    func setupCopyButton() {
        addSubview(copyButton)
        copyButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        copyButton.addSubview(copyButtonContentView)
        copyButtonContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupFeedbackLabel() {
        addSubview(feedbackLabel)
        feedbackLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
