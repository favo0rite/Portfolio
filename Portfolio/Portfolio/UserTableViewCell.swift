//
//  UserTableViewCell.swift
//  Portfolio
//
//  Created by Pavel Zamotaev on 03.11.2022.
//

import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {

    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Пусто"
        label.font = UIFont.systemFont(ofSize: 30)
        
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupViews()
    }

    func setupViews() {
        self.addSubview(fullNameLabel)

        fullNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
    }
}
