//
//  OnboardingImageView.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

enum OnboardingPage: CaseIterable {
  case first
  case second
  case third
}

extension OnboardingPage {
  var onboardingImage: UIImage? {
    switch self {
    case .first: return .onboarding1
    case .second: return .onboarding2
    case .third: return .onboarding3
    }
  }
  
  var title: String {
    switch self {
    case .first:
      return "아침에 일어나보니\n룸메가 부엌에서 커피를 내리고 있네요"
    case .second:
      return "퇴근 후 거실에 들어오니,\n룸메가 거실에서 먹다 남은 \n과자와 음료수를 치우지 않았어요"
    case .third:
      return "저녁이 되자 룸메가 말해요\n“오늘 친구 한 명 저녁에 놀러 와도 될까?”"
    }
  }
  
}


final class OnboardingImageView: BaseUIView {
  
  private let onboardingImage = UIImageView()
  private let titleLabel = UILabel()
  
  var tapAction: (() -> Void)?

  private let onboardingPage: OnboardingPage
  
  init(page: OnboardingPage) {
    self.onboardingPage = page
    super.init(frame: .zero)
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) { fatalError() }
  
  override func setUI() {
    layer.backgroundColor = UIColor.white.cgColor
    let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
    addGestureRecognizer(tap)
    
    titleLabel.do {
      $0.font = UIFont.head_bold_22
      $0.text = onboardingPage.title
      $0.textAlignment = .center
      $0.numberOfLines = 3
      $0.textColor = .white
    }
    onboardingImage.do {
      $0.image = onboardingPage.onboardingImage
      $0.contentMode = .scaleAspectFill
    }
  }
  
  override func setLayout() {
    addSubview(onboardingImage)
    addSubview(titleLabel)

    onboardingImage.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    titleLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(90)
    }
  }
  
  @objc private func didTap() { tapAction?() }
  
  func configure(onboardingPage: OnboardingPage) {
    onboardingImage.image = onboardingPage.onboardingImage
    titleLabel.text = onboardingPage.title
  }
}

#if DEBUG
import SwiftUI

struct OnboardingImageViewWrapper: UIViewRepresentable {
  func makeUIView(context: Context) -> OnboardingImageView {
    OnboardingImageView(page: .first)
  }

  func updateUIView(_ uiView: OnboardingImageView, context: Context) { }
}

#Preview {
  OnboardingImageViewWrapper()
    .frame(width: 300, height: 400)
    .previewLayout(.sizeThatFits)
}
#endif
