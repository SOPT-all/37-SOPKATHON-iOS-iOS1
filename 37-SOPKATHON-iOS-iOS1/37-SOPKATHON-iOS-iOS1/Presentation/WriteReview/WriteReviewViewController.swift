//
//  WriteReviewViewController.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//


import UIKit

import SnapKit
import Then

final class WriteReviewViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private let writeReviewView = WriteReviewView()
    private let roomService = RoomService()
    var roomid: Int?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        writeReviewView.roomInfoView.delegate = self
        
        writeReviewView.makeXButton.addTarget(self, action: #selector(makeXButtonTapped), for: .touchUpInside)
        
    }
    
    // MARK: - Custom Methods
    
    override func setUI() {
        view.addSubview(writeReviewView)
    }
    
    override func setLayout() {
        writeReviewView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc private func makeXButtonTapped() {
        requestPostRoommateInfo()
        pushToFRoomSendViewController()
        
    }
    
    private func pushToFRoomSendViewController() {
        let viewController = FRoomSendViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func requestPostRoommateInfo() {
        let roomInfoView = writeReviewView.roomInfoView
        
        guard let monthlyRentText = roomInfoView.getMonthlyFeeText(),
              let monthlyRent = Int(monthlyRentText),
              let period = roomInfoView.getPeriodText()
        else {
            print("🚨 RoomInfoView: 필수 입력 필드 (월세/기간) 확인 필요.")
            return
        }
        
        let body = RoomInfoDTO(
            location: "프랑스 파리",
            monthlyRent: monthlyRent,
            roomCount: roomInfoView.roomCountValue,
            bathroomCount: roomInfoView.restroomCountValue,
            period: period,
            intimacy: 50,
            homeFrequency: "저녁은 집에서",
            drinkingCapacity:"애주가에요",
            cleanliness: "바로바로 치워요",
            smoke: "담배 안펴요",
            description: description,
            washerCount: roomInfoView.laundryCountValue
        )
        
        roomService.postRoommateInfo(body: body) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("✅ 룸메이트 소개서 생성 성공! Code: \(response.code), Room ID: \(response.data?.roomId ?? -1)")
                    
                    self.roomid = response.data?.roomId ?? -1
                case .failure(let error):
                    print("❌ 룸메이트 소개서 생성 실패: \(error.localizedDescription)")
                }
            }
        }
    }
}

extension WriteReviewViewController: RoomInfoViewDelegate {
    
    func roomInfoViewRequestPresent(_ viewControllerToPresent: UIViewController) {
        present(viewControllerToPresent, animated: true)
    }

    func roomInfoViewRequestDismiss(_ viewControllerToDismiss: UIViewController) {
        viewControllerToDismiss.dismiss(animated: true)
    }

    func roomInfoViewAddRecord() {
        print("Record 추가 요청")
    }
}
