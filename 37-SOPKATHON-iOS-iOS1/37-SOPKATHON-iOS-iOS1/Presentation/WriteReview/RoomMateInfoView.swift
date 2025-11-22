//
//  RoomMateInfoView.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 박정환 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class RoomMateInfoView: BaseUIView {

    // MARK: - UI Components

    private let titleLabel = UILabel().then {
        $0.text = "룸메 정보 선택"
        $0.font = .head_bold_24
        $0.textColor = .gray800
    }

    // MARK: 친밀도
    private let closenessLabel = UILabel().then {
        $0.text = "친밀도"
        $0.font = .head_semibold_16
        $0.textColor = .gray800
    }

    private let closenessSlider = ClosenessSlider()

    // MARK: 집에 있는 정도
    private let homeLabel = UILabel().then {
        $0.text = "집에 있는 정도"
        $0.font = .head_semibold_16
        $0.textColor = .gray800
    }

    private let homeSelectView = SelectCollectionView(items: [
        "잠만 자고 나가요", "저녁은 집에서",
        "주로 집에 있어요", "밖을 잘 안 나가요.."
    ])

    // MARK: 주량
    private let drinkLabel = UILabel().then {
        $0.text = "주량"
        $0.font = .head_semibold_16
        $0.textColor = .gray800
    }

    private let drinkSelectView = SelectCollectionView(items: [
        "술 안마셔요", "가끔 기분만",
        "술 마시는걸 즐겨요", "애주가예요"
    ])

    // MARK: 청결도
    private let cleanLabel = UILabel().then {
        $0.text = "청결도"
        $0.font = .head_semibold_16
        $0.textColor = .gray800
    }

    private let cleanSelectView = SelectCollectionView(items: [
        "먼지 한톨도 용납 못해요", "바로바로 치워요",
        "몰아서 치워요", "조금 더러워도 괜찮아요"
    ])

    // MARK: 흡연
    private let smokeLabel = UILabel().then {
        $0.text = "흡연"
        $0.font = .head_semibold_16
        $0.textColor = .gray800
    }

    private let smokeSelectView = SelectCollectionView(items: [
        "담배 안펴요", "담배 펴요"
    ])

    // MARK: 룸메 소개
    private let aboutLabel = UILabel().then {
        $0.text = "룸메에 대해"
        $0.font = .head_semibold_16
        $0.textColor = .gray800
    }

    let aboutTextField = UITextView().then {
        $0.text = ""
        $0.font = .body_regular_12
        $0.textColor = .black
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray100.cgColor
        $0.textContainerInset = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        $0.isScrollEnabled = true
    }
    
    private let aboutPlaceholderLabel = UILabel().then {
        $0.text = "룸메에 대해 소개해주세요."
        $0.font = .body_regular_12
        $0.textColor = .gray300
    }

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Set UI

    override func setUI() {
        addSubviews(titleLabel, closenessLabel, closenessSlider, homeLabel, homeSelectView, drinkLabel, drinkSelectView, cleanLabel, cleanSelectView, smokeLabel, smokeSelectView, aboutLabel, aboutTextField)
        aboutTextField.addSubview(aboutPlaceholderLabel)
        aboutTextField.delegate = self
    }

    // MARK: Layout

    override func setLayout() {

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }

        closenessLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(27)
            $0.leading.equalToSuperview().offset(20)
        }

        closenessSlider.snp.makeConstraints {
            $0.top.equalTo(closenessLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }

        homeLabel.snp.makeConstraints {
            $0.top.equalTo(closenessSlider.snp.bottom).offset(28)
            $0.leading.equalTo(closenessLabel)
        }

        homeSelectView.snp.makeConstraints {
            $0.top.equalTo(homeLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }

        drinkLabel.snp.makeConstraints {
            $0.top.equalTo(homeSelectView.snp.bottom).offset(28)
            $0.leading.equalTo(closenessLabel)
        }

        drinkSelectView.snp.makeConstraints {
            $0.top.equalTo(drinkLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }

        cleanLabel.snp.makeConstraints {
            $0.top.equalTo(drinkSelectView.snp.bottom).offset(28)
            $0.leading.equalTo(closenessLabel)
        }

        cleanSelectView.snp.makeConstraints {
            $0.top.equalTo(cleanLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }

        smokeLabel.snp.makeConstraints {
            $0.top.equalTo(cleanSelectView.snp.bottom).offset(28)
            $0.leading.equalTo(closenessLabel)
        }

        smokeSelectView.snp.makeConstraints {
            $0.top.equalTo(smokeLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(32)
        }

        aboutLabel.snp.makeConstraints {
            $0.top.equalTo(smokeSelectView.snp.bottom).offset(38)
            $0.leading.equalTo(closenessLabel)
        }
        aboutTextField.snp.makeConstraints {
            $0.top.equalTo(aboutLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(140)
            $0.bottom.equalToSuperview()
        }
        aboutPlaceholderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(aboutTextField.textContainerInset.top)
            $0.leading.equalToSuperview().inset(aboutTextField.textContainerInset.left)
        }
    }
}

extension RoomMateInfoView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        aboutPlaceholderLabel.isHidden = !textView.text.isEmpty
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        aboutPlaceholderLabel.isHidden = true
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        aboutPlaceholderLabel.isHidden = !textView.text.isEmpty
    }
}
