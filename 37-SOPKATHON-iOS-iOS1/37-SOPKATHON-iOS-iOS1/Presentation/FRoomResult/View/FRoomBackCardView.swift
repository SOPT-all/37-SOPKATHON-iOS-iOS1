//
//  FRoomBackCardView.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/23/25.
//

import UIKit

import Then
import SnapKit

final class FRoomBackCardView: BaseUIView {
    var review: String
    
    private let xLabel = UIImageView().then {
        $0.image = .xBig
    }
    
    private let xLabel2 = UILabel().then {
        $0.text = "방 후기"
        $0.textColor = .black0
        $0.font = .head_semibold_18
    }
    
    private lazy var reviewLabel = UILabel().then {
        $0.text = review
        $0.numberOfLines = 0
        $0.textColor = .gray800
        $0.font = .body_regular_12
    }
    
    init(review: String) {
        self.review = review
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubviews(xLabel, xLabel2, reviewLabel)
        reviewLabel.text = review
    }
    
    override func setLayout() {
        xLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(35)
        }
        
        xLabel2.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(56)
            $0.top.equalToSuperview().inset(37)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(xLabel2.snp.bottom).offset(13)
        }
    }
    
    func updateReview(_ text: String) {
        review = text
        reviewLabel.text = text
      }
}
