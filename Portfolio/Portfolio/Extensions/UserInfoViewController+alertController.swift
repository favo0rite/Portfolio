//
//  UserInfoViewController+alertController.swift
//  Portfolio
//
//  Created by Pavel Zamotaev on 18.10.2022.
//

import UIKit

extension UserInfoViewController {
    func presentAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let choiseImageFromGalery = UIAlertAction(title: "Установить из галереи", style: .default) {_ in
            self.chooseImagePickerAction(source: .photoLibrary)
        }

        let makePhoto = UIAlertAction(title: "Сделать фото", style: .default) {_ in
            self.chooseImagePickerAction(source: .camera)
        }

        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        ac.addAction(choiseImageFromGalery)
        ac.addAction(makePhoto)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }

    private func chooseImagePickerAction(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}
