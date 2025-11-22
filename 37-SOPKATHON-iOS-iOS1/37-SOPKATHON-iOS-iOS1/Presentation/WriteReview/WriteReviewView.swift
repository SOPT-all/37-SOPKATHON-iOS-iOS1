//
//  WriteReviewView.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class WriteReviewView: BaseUIView {
    
    // MARK: - Properties
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.alwaysBounceVertical = true
        $0.backgroundColor = .white
    }
    
    private let contentView = UIView()
    
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = .xx
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .head_bold_22
        $0.text = "방 소개서 입력하기"
        $0.textColor = .gray800
    }
    
    private let roomMateInfoView = RoomMateInfoView()
    
    private lazy var makeXButton = CustomButton(type: .createXIntro)
    let roomInfoView = RoomInfoView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    override func setUI() {
        backgroundColor = .white
        
        addSubviews(scrollView, makeXButton)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            iconImageView,
            titleLabel,
            roomInfoView,
            roomMateInfoView
        )
    }
    
    override func setLayout() {
        
        makeXButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(35)
        }
        
        scrollView.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalTo(makeXButton.snp.top).offset(20)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.bottom.equalTo(roomMateInfoView.snp.bottom).offset(69)
        }
        
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalTo(titleLabel)
            $0.width.height.equalTo(26)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(5)
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(12)
            $0.height.equalTo(26)
        }
        

        roomInfoView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
        }
        roomMateInfoView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(43)
            $0.leading.trailing.equalToSuperview()
        }
        
        makeXButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(30)
        }
    }
}
