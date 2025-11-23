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
    var monthlyRent: Int = 2344
    var period: String = "djfkdjfdkf"
    var roomCount: Int = 2
    var bathroomCount: Int = 1
    var washerCount: Int = 3
    var review: String = "서로 바빠서 얼굴 볼 시간은 많이 없었지만, 같이 사는 내내 정말 편했습니다. 제일 중요한 월세나 공과금 입금은 단 한 번도 늦으신 적 없고, 오히려 저보다 먼저 챙겨서 정산 내역 보내주실 정도로 꼼꼼하세요. 불필요한 간섭이나 tmi 대화 없이 딱 필요한 소통만 깔끔하게 하시는 편이라, 독립적인 성향 가지신 분들에게는 이보다더 편한 룸메이트는 없을 것 같습니다. 물건 섞일 일도 전혀 없고, 본인 관리 철저하신멋진 분이에요."
    
    private func fetchRoomInfo(roomId: Int) {
        let provider = MoyaProvider<XRoomAPI>()

        provider.request(.roomInfo(roomId: roomId)) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(RoomInfoResponse.self, from: response.data)
                    self.updateUI(with: decoded.data)
                } catch {
                    print("Decode Error:", error)
                }
            case .failure(let error):
                print("Network Error:", error)
            }
        }
    }

    private func updateUI(with data: RoomInfo) {
        self.location = data.location
        self.monthlyRent = data.monthlyRent
        self.period = data.period
        self.roomCount = data.roomCount
        self.bathroomCount = data.bathroomCount
        self.washerCount = data.washerCount

        frontCard.configure(
            location: location,
            monthlyRent: monthlyRent,
            period: period,
            roomCount: roomCount,
            bathroomCount: bathroomCount,
            washerCount: washerCount
        )
    }
    
    func getXRoommate() {
       let provider = MoyaProvider<XRoomAPI>()
       provider.request(.getRoommate(roomId: 3)) { result in
           switch result {
           case .success(let response):
               do {
                   let decoded = try JSONDecoder().decode(RoommateResponse.self, from: response.data)
                   let content = decoded.data?.content ?? "없음"

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
    
    private let titleLabel = UILabel().then {
        $0.text = "이런 New방 어때요?"
        $0.font = .head_bold_24
        $0.textColor = .gray800
    }
    private let inquireButton = CustomButton(type: .xRoomInquiry)
    private let anotherButton = CustomButton(type: .anotherRoom)
    private lazy var toast = ToastMessage(title: "")
    private lazy var t = ChooseToastMessage()
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
    
    private lazy var toGoView = ToGoXroomView().then {
        $0.delegate = self
        $0.isHidden = true
    }

    
    private lazy var frontCard = FRoomFrontCardView(location: location, monthlyRent: monthlyRent, period: period, roomCount: roomCount, bathroomCount: bathroomCount, washerCount: washerCount).then {
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
    }
    
    private lazy var backCard = FRoomBackCardView(review: review).then {
        $0.isHidden = true
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRoomInfo(roomId: 3)
    }
    
    override func setUI() {
        view.addSubviews(titleLabel, inquireButton, anotherButton, cardContainer, toGoView)
        
        cardContainer.addSubview(roundedContentView)
        roundedContentView.addSubviews(frontCard, backCard)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleCardTap))
        roundedContentView.addGestureRecognizer(tap)

        backCard.isHidden = true
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
        
        toGoView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(52)
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
    
    private func showToGoView() {
        toGoView.alpha = 0
        toGoView.isHidden = false

        UIView.animate(withDuration: 0.3) {
            self.toGoView.alpha = 1
        }
    }
}

extension FRoomResultViewController: CustomButtonDelegate {
    func customButtonDidTap(_ button: CustomButton, type: CustomButtonType) {
        toast.makeToast(on: self.view, message: "전화번호가 복사되었습니다")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.showToGoView()
        }
    }
}

extension FRoomResultViewController: ToGoXroomViewDelegate {
    func toGoButtonTapped() {
        let vc = WriteReviewViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
