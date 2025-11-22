//
//  OnboardingStep2VC.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class OnboardingStep2VC: UIViewController {

  private let onboardingView = OnboardingImageView(page: .second)
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
      $0.height.equalTo(530)
    }

    stackView.snp.makeConstraints {
      $0.top.equalTo(onboardingView.snp.bottom).offset(16)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.lessThanOrEqualToSuperview()
    }
  }

  private func addButtons() {
    let titles = [
      "“알아서 치우겠지~”\n신경 쓰지 않고 내 할 일 한다",
      "“아.. 내가 치워야겠다”\n내가 바로 치운다. 깔끔하게 정돈한다",
      "“앞으로 먹은 건 바로 치워줬으면 좋겠어”\n가볍게 이야기해서 정리 루틴을 맞춘다",
      "“이건 너무하지!!”\n공용 공간은 깔끔해야 한다고 생각해 화가난다"
    ]

    titles.forEach { text in
      let button = SimulationButton(title: text)
      stackView.addArrangedSubview(button)

      button.tapAction = { [weak self] in
          let vc = OnboardingStep3VC()
          self?.navigationController?.pushViewController(vc, animated: true)
      }
    }
  }
}
