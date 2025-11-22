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
    
    private let navigationLabel = UILabel().then {
        $0.font = .head_semibold_18
        $0.text = "내가 썼던 방 후기 쓰기"
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .head_bold_22
        $0.text = "방 정보 입력하기"
        $0.textColor = .black
    }
    
    private let roomMateInfoView = RoomMateInfoView()
    
    private lazy var makeXButton = CustomButton(type: .createXIntro)
    
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
        
        addSubviews(scrollView,makeXButton)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            navigationLabel,
            titleLabel,
            roomMateInfoView
        )
    }
    
    override func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.bottom.equalTo(roomMateInfoView.snp.bottom).offset(69)
        }
        
        navigationLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(12)
            $0.height.equalTo(22)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(19)
            $0.top.equalTo(navigationLabel.snp.bottom).offset(28)
            $0.height.equalTo(26)
        }
        
        roomMateInfoView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(43)
            $0.leading.trailing.equalToSuperview()
        }
        
        makeXButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(35)
        }
    }
}

#Preview {
    WriteReviewView()
}
