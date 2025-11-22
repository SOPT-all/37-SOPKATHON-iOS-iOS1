//
//  ResultViewController.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class ResultViewController: BaseUIViewController {
  
  private let typeImageView = UIImageView()
  private let goToRecommandButton = CustomButton(type: .myRecommand)
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setUI() {
    view.backgroundColor = .gray100
    view.addSubviews(typeImageView, goToRecommandButton)
    
    typeImageView.do {
      $0.image = .type
      $0.contentMode = .scaleAspectFit
    }
    
    goToRecommandButton.do {
      $0.addTarget(self, action: #selector(goToRecommandButtonTapped), for: .touchUpInside)
    }
    
    view.addSubviews(typeImageView, goToRecommandButton)
  }
  
  override func setLayout() {
    
    typeImageView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(69)
      $0.height.equalTo(500)
    }
    
    goToRecommandButton.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(34)
    }
  }
  
  @objc private func goToRecommandButtonTapped() {
    let vc = FRoomResultViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}
