//
//  ViewController.swift
//  Portfolio
//
//  Created by Pavel Zamotaev on 18.10.2022.
//

import UIKit
import SnapKit

class UserInfoViewController: UIViewController {
    
    // MARK: UI

    var user = User()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        let image = user.avatarImage
        imageView.image = image
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()

    private lazy var cameraButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 0.5 * Constants.cameraButtonSize
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Camera"), for: .normal)
        button.addTarget(self, action: #selector(cameraButtonAction), for: .touchUpInside)
        
        return button
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = user.name! + " " + user.surname!
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()

    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.text = user.post!
        
        return label
    }()

    private lazy var adressLabel: UILabel = {
        let label = UILabel()
        label.text = user.adress!
        label.numberOfLines = 3
        
        return label
    }()

    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Редактировать", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
        return button
    }()

    private lazy var copyAdressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Copy adress", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(copyAdressButtonAction), for: .touchUpInside)
        
        return button
    }()

    // MARK: Properties

    var isFullInitials = true

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupImageView()
        setupCameraButton()
        setupNameLabel()
        setupPostLabel()
        setupEditButton()
        setupAdressLabel()
        setupCopyAdressButton()
    }

    // MARK: Loading views

    func setupImageView() {
        view.addSubview(avatarImageView)
        
        avatarImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.spacingOnSides)
            $0.leading.equalToSuperview().offset(Constants.spacingOnSides)
            $0.trailing.equalToSuperview().offset(-Constants.spacingOnSides)
            $0.height.equalTo(350)
        }
    }

    func setupCameraButton() {
        avatarImageView.addSubview(cameraButton)

        cameraButton.snp.makeConstraints {
            $0.height.equalTo(Constants.cameraButtonSize)
            $0.width.equalTo(Constants.cameraButtonSize)
            $0.trailing.equalTo(avatarImageView).offset(-Constants.spacingOnSides / 2)
            $0.bottom.equalTo(avatarImageView).offset(-Constants.spacingOnSides / 2)
        }
        
    }

    func setupNameLabel() {
        view.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.bottom).offset(Constants.spacingOnSides)
            $0.trailing.equalToSuperview().offset(-Constants.spacingOnSides)
            $0.leading.equalToSuperview().offset(Constants.spacingOnSides)
        }
    }

    func setupPostLabel() {
        view.addSubview(postLabel)

        postLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(Constants.spacingOnSides)
            $0.trailing.equalToSuperview().offset(-Constants.spacingOnSides)
            $0.leading.equalToSuperview().offset(Constants.spacingOnSides)
        }
    }

    func setupEditButton() {
        view.addSubview(editButton)
    
        editButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-Constants.spacingOnSides)
            $0.leading.equalToSuperview().offset(Constants.spacingOnSides)
            $0.trailing.equalToSuperview().offset(-Constants.spacingOnSides)
        }
    }

    func setupAdressLabel() {
        view.addSubview(adressLabel)
    
        adressLabel.snp.makeConstraints {
            $0.top.equalTo(postLabel.snp.bottom).offset(Constants.spacingOnSides)
            $0.trailing.equalToSuperview().offset(-Constants.spacingOnSides)
            $0.leading.equalToSuperview().offset(Constants.spacingOnSides)
        }
    }

    func setupCopyAdressButton() {
        view.addSubview(copyAdressButton)
        
        copyAdressButton.snp.makeConstraints {
            $0.top.equalTo(adressLabel.snp.bottom).offset(Constants.spacingOnSides)
            $0.leading.equalToSuperview().offset(Constants.spacingOnSides)
            $0.height.equalTo(40)
            $0.width.equalTo(100)
        }
    }

    
    // MARK: Actions
    
    @objc func cameraButtonAction() {
        presentAlertController(withTitle: "Выберите изображение профиля", message: nil, style: .actionSheet)
    }

    @objc func editButtonAction() {
        if isFullInitials {
            nameLabel.text = Constants.name
            isFullInitials = false
        } else {
            nameLabel.text = Constants.fullInitials
            isFullInitials = true
        }
    }

    @objc func copyAdressButtonAction() {
        UIPasteboard.general.string = adressLabel.text
    }
}

// MARK: Extensions

extension UserInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.editedImage] as? UIImage
        self.avatarImageView.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
}

