//
//  OnboardingStep1VC.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class OnboardingStep1VC: UIViewController {

  //private let navBar = NavigationBar()
  private let onboardingView = OnboardingImageView(page: .first)
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

    view.addSubviews(onboardingView,stackView)
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
      "“…”\n조용히 지나가 준비하고 바로 외출한다",
      "“굿모닝~”\n자연스러운 아침인사만 나눈다",
      "“잘 잤어? 나도 커피 한 잔 해야겠다”\n반갑게 같이 커피를 마시며 이야기를 나눈다",
      "“Zzz”\n너무 일찍 일어났다. 다시 자리 들어간다"
    ]

    titles.forEach { text in
      let button = SimulationButton(title: text)
      stackView.addArrangedSubview(button)

      button.tapAction = { [weak self] in
          let vc = OnboardingStep2VC()
          self?.navigationController?.pushViewController(vc, animated: true)
      }
    }
  }
}
