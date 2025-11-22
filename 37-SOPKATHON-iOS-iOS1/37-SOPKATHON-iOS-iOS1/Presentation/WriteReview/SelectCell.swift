//
//  SelectCell.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 박정환 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class SelectCell: UICollectionViewCell {

    static let id = "SelectCell"

    private let titleLabel = UILabel().then {
        $0.font = .body_medium_16
        $0.textColor = .gray800
        $0.textAlignment = .center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 4
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray200.cgColor
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.25
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)

        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(3)
        }
    }

    required init?(coder: NSCoder) { fatalError() }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateSelection(isSelected: false)
    }

    func configure(text: String) {
        titleLabel.text = text
    }
    
    func updateSelection(isSelected: Bool) {
        if isSelected {
            contentView.backgroundColor = .mainColorRed
            titleLabel.textColor = .white
        } else {
            contentView.backgroundColor = .white
            titleLabel.textColor = .gray800
        }
    }
}
