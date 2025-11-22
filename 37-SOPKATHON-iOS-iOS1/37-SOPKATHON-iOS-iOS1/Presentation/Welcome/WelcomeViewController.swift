//
//  WelcomeViewController.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: BaseUIViewController {
  
  private let contentLabel = UILabel()
  private let startButton = CustomButton(type: .start)
  private let backgroundImageView = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setUI() {
    view.backgroundColor = .white

        backgroundImageView.do {
          $0.image = .background
            $0.contentMode = .scaleAspectFill
        }

        view.insertSubview(backgroundImageView, at: 0)
        view.addSubviews(contentLabel, startButton)

    
    contentLabel.do {
      $0.font = UIFont.body_regular_16
      $0.text = "새로 들어갈 쉐어하우스.\nNEW 메이트 방이 열였습니다 지금 체험해보세요"
      $0.textAlignment = .center
      $0.numberOfLines = 3
      $0.textColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    startButton.do {
      $0.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    view.addSubviews(contentLabel, startButton)
  }
  
  override func setLayout() {
    backgroundImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    contentLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(startButton.snp.top).offset(-36)
    }
    
    startButton.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(34)
    }
  }
  
  @objc private func startButtonTapped() {
     let vc = OnboardingStep1VC()
     navigationController?.pushViewController(vc, animated: true)
  }
}
