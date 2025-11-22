//
//  FRoomSendViewController.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/23/25.
//

import UIKit

import Then
import SnapKit

final class FRoomSendViewController: BaseUIViewController {
    
    /// 더미
    var review: String = "서로 바빠서 얼굴 볼 시간은 많이 없었지만, 같이 사는 내내 정말 편했습니다. 제일 중요한 월세나 공과금 입금은 단 한 번도 늦으신 적 없고, 오히려 저보다 먼저 챙겨서 정산 내역 보내주실 정도로 꼼꼼하세요. 불필요한 간섭이나 tmi 대화 없이 딱 필요한 소통만 깔끔하게 하시는 편이라, 독립적인 성향 가지신 분들에게는 이보다더 편한 룸메이트는 없을 것 같습니다. 물건 섞일 일도 전혀 없고, 본인 관리 철저하신멋진 분이에요."
    
    private let titleImage = UIImageView().then {
        $0.image = .xBig
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "방 소개서를 보내시겠어요?"
        $0.font = .head_bold_24
        $0.textColor = .gray800
    }
    
    private let sendButton = CustomButton(type: .xSend)
    private lazy var toast = ChooseToastMessage()
    
    /// 해보장
    private let cardContainer = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 12
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
    }

    private let roundedContentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true   // 코너 깎임 유지
    }
    
    private lazy var backCard = FRoomBackCardView(review: review).then {
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
    }
    
    override func setUI() {
        view.addSubviews(titleImage, titleLabel, sendButton, cardContainer)
        
        cardContainer.addSubview(roundedContentView)
        roundedContentView.addSubviews(backCard)
    }
    
    override func setLayout() {
        titleImage.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(11)
            $0.leading.equalToSuperview().inset(42)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleImage.snp.trailing)
            $0.centerY.equalTo(titleImage)
        }
        
        sendButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34)
            $0.centerX.equalToSuperview()
        }
        
        cardContainer.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(32.5)
            $0.top.equalToSuperview().inset(151)
            $0.height.equalTo(463)
        }

        roundedContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        backCard.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    override func setDelegate() {
        sendButton.delegate = self
    }
}

extension FRoomSendViewController: CustomButtonDelegate {
    func customButtonDidTap(_ button: CustomButton, type: CustomButtonType) {
        toast.makeChooseToast(on: self.view)
    }
}
