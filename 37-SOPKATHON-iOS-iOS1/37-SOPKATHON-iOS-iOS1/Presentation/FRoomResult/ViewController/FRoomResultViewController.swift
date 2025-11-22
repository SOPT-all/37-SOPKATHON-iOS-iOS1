//
//  FRoomResultViewController.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/23/25.
//

import UIKit

import Then
import SnapKit
import Moya

final class FRoomResultViewController: BaseUIViewController {
  
  /// 더미
  var location: String = "잘 나오니?"
  var monthMoney: Int = 2344
  var duration: String = "djfkdjfdkf"
  var roomNum: Int = 2
  var toiletNum: Int = 1
  var washingNum: Int = 3
  var review: String = ""
  
  private let titleLabel = UILabel().then {
    $0.text = "이런 New방 어때요?"
    $0.font = .head_bold_24
    $0.textColor = .gray800
  }
  private let inquireButton = CustomButton(type: .xRoomInquiry)
  private let anotherButton = CustomButton(type: .anotherRoom)
  private lazy var toast = ToastMessage(title: "")
  private lazy var t = ChooseToastMessage()
  
  let provider = MoyaProvider<FlagPlusAPI>(plugins: [MoyaLoggerPlugin()])
  
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
  
  
  private lazy var frontCard = FRoomFrontCardView(location: location, monthMoney: monthMoney, duration: duration, roomNum: roomNum, toiletNum: toiletNum, washingNum: washingNum).then {
    $0.layer.cornerRadius = 12
    $0.layer.masksToBounds = true
  }
  
  private lazy var backCard = FRoomBackCardView(review: review).then {
    $0.isHidden = true
    $0.layer.cornerRadius = 12
    $0.layer.masksToBounds = true
  }
  
  override func setUI() {
    view.addSubviews(titleLabel, inquireButton, anotherButton, cardContainer)
    
    cardContainer.addSubview(roundedContentView)
    roundedContentView.addSubviews(frontCard, backCard)
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleCardTap))
    roundedContentView.addGestureRecognizer(tap)
    
    backCard.isHidden = true
    
    getXRoommate()
  }
  
  override func setLayout() {
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(37.5)
      $0.centerX.equalToSuperview()
    }
    
    inquireButton.snp.makeConstraints {
      $0.bottom.equalTo(anotherButton.snp.top).offset(-30)
      $0.centerX.equalToSuperview()
    }
    
    anotherButton.snp.makeConstraints {
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
    
    frontCard.snp.makeConstraints { $0.edges.equalToSuperview() }
    backCard.snp.makeConstraints { $0.edges.equalToSuperview() }
  }
  
  override func setDelegate() {
    inquireButton.delegate = self
    anotherButton.delegate = self
  }
}

extension FRoomResultViewController {
  @objc private func handleCardTap() {
    flipCard()
  }
  
  func flipCard() {
    let from = frontCard.isHidden ? backCard : frontCard
    let to = frontCard.isHidden ? frontCard : backCard
    
    UIView.transition(
      with: roundedContentView,
      duration: 0.3,
      options: .transitionFlipFromLeft,
      animations: {
        from.isHidden = true
        to.isHidden = false
      }
    )
  }
  
  private func getXRoommate() {
    provider.request(.getRoommate(roomId: 3)) { result in
      switch result {
      case .success(let response):
        do {
            let decoded = try JSONDecoder().decode(RoommateResponse.self, from: response.data)
            let content = decoded.data?.content ?? "없음"   // data 없으면 빈 문자열

            self.review = content
          DispatchQueue.main.async {
            self.backCard.updateReview(content)
          }
          print("🥹 \(content)")
          
        } catch {
            print("Decoding error:", error)
        }
      case .failure(let error):
        print("실패:", error)
      }
    }
  }
}

extension FRoomResultViewController: CustomButtonDelegate {
  func customButtonDidTap(_ button: CustomButton, type: CustomButtonType) {
    toast.makeToast(on: self.view, message: "전화번호가 복사되었습니다")
  }
}
