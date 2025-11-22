//
//  CustomButton.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

protocol CustomButtonDelegate: AnyObject {
  func customButtonDidTap(_ button: CustomButton, type: CustomButtonType)
}

final class CustomButton: UIButton {
  
  private let customButtonType: CustomButtonType
  
  weak var delegate: CustomButtonDelegate?
  
  private let buttonLabel = UILabel()
  private let buttonView = UIView()
  
  init(type: CustomButtonType) {
    self.customButtonType = type
    super.init(frame: .zero)
    setHierarchy()
    setUI()
    setLayout()
    
    addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
    buttonLabel.do {
      $0.text = customButtonType.title
      $0.font = UIFont.head_semibold_18
      $0.textColor = customButtonType.fontColor
    }
    buttonView.do {
      $0.backgroundColor = customButtonType.backgroundColor
      $0.layer.cornerRadius = 10
      $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
      $0.layer.shadowOpacity = 1
      $0.layer.shadowRadius = 2
      $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
  }
  
  private func setHierarchy() {
    self.addSubviews(
      buttonView,
      buttonLabel
    )
    
    buttonView.isUserInteractionEnabled = false
  }
  
  private func setLayout() {
    buttonView.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.width.equalTo(customButtonType.width)
      $0.height.equalTo(customButtonType.height)
    }
    buttonLabel.snp.makeConstraints {
      $0.centerX.equalTo(buttonView)
      $0.centerY.equalTo(buttonView)
    }
  }
  
  //MARK: - method

  @objc
  private func didTapButton() {
      delegate?.customButtonDidTap(self, type: customButtonType)
  }
}

#Preview {
  CustomButton(type: .cardInquiry)
}
