//
//  FRoomResultViewController.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/23/25.
//

import UIKit

import Then
import SnapKit

final class FRoomResultViewController: BaseUIViewController {
    private let titleLabel = UILabel().then {
        $0.text = "이런 New방 어때요?"
        $0.font = .head_bold_24
        $0.textColor = .gray800
    }
    private let inquireButton = CustomButton(type: .xRoomInquiry)
    private let anotherButton = CustomButton(type: .anotherRoom)
    
    override func setUI() {
        view.addSubviews(titleLabel, inquireButton, anotherButton)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(37.5)
            $0.centerX.equalToSuperview()
        }
        
        inquireButton.snp.makeConstraints {
            $0.bottom.equalTo(anotherButton.snp.top).offset(-10)
        }
        
        anotherButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34)
        }
    }
}
