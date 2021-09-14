//
//  ReceiptView.swift
//  Atletas
//
//  Created by André Schueda on 11/09/21.
//

import UIKit

class ReceiptView: UIView {
    var navigationController: UINavigationController?
    var contentView: ConfirmDonationContentView?
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Insira abaixo o comprovante Pix de sua Doação:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(named: "receiptDescription")
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var receiptImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(named: "donationCell")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var uploadPhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return button
    }()
    
    @objc func clickedButton() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        navigationController?.present(imagePicker, animated: true, completion: nil)
    }
    
    lazy var uploadPhotoButtonContentView: UploadPhotoButtonContentView = {
        let view = UploadPhotoButtonContentView()
        view.isUserInteractionEnabled = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupDescriptionLabel()
        setupReceiptImageView()
        setupUploadPhotoButton()
    }
    
    func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setupReceiptImageView() {
        addSubview(receiptImageView)
        receiptImageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.25)
            make.bottom.equalToSuperview()
        }
    }
    
    func setupUploadPhotoButton() {
        addSubview(uploadPhotoButton)
        uploadPhotoButton.snp.makeConstraints { make in
            make.edges.equalTo(receiptImageView)
        }
        
        uploadPhotoButton.addSubview(uploadPhotoButtonContentView)
        uploadPhotoButtonContentView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ReceiptView: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else { return }
        receiptImageView.image = image
        
        uploadPhotoButtonContentView.alpha = 0
        contentView?.sendButton.backgroundColor = UIColor(named: "ButtonGreen")
        contentView?.sendButton.isEnabled = true
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
