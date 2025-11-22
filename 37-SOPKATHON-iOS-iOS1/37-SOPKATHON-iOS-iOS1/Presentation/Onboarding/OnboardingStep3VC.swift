//
//  OnboardingStep3VC.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//
//
//  OnboardingStep2VC.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class OnboardingStep3VC: UIViewController {

  private let onboardingView = OnboardingImageView(page: .third)
  private let stackView = UIStackView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    setupLayout()
    addButtons()
  }

  private func setupUI() {
    stackView.do {
      $0.axis = .vertical
      $0.spacing = 12
      $0.alignment = .fill
      $0.distribution = .equalSpacing
    }

    view.addSubviews(onboardingView, stackView)
  }

  private func setupLayout() {

    onboardingView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalToSuperview()
      $0.height.equalTo(500)
    }

    stackView.snp.makeConstraints {
      $0.top.equalTo(onboardingView.snp.bottom).offset(16)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.lessThanOrEqualToSuperview()
    }
  }

  private func addButtons() {
    let titles = [
      "“좋지! 나도 같이 놀래!”\n재밌을 것 같아 기대된다",
      "“응 미리 말해주면 괜찮아!”\n말만 해주면 부담 없다",
      "“오늘은 조용히 있고 싶은 한데…”\n주저한다",
      "“집에서는 혼자만의 시간이 중요해.”\n주거공간에 외부인이 방문하는 게 싫다"
    ]

    titles.forEach { text in
      let button = SimulationButton(title: text)
      stackView.addArrangedSubview(button)

      button.tapAction = { [weak self] in
          let vc = ResultViewController()
          self?.navigationController?.pushViewController(vc, animated: true)
      }
    }
  }
}
