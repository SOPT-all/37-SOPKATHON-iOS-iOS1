//
//  SimulationButton.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class SimulationButton: BaseUIView {
  
  private let buttonView = UIView()
  private let titleLabel = UILabel()
  
  var tapAction: (() -> Void)?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience init(title: String) {
    self.init(frame: .zero)
    configure(title: title)
  }
  
  required init?(coder: NSCoder) { fatalError() }
  
  override func setUI() {
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
    addGestureRecognizer(tap)
    
    addSubview(buttonView)
    
    buttonView.do {
      $0.layer.cornerRadius = 15
      $0.backgroundColor = UIColor(.gray000)
      $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
      $0.layer.shadowOpacity = 1
      $0.layer.shadowRadius = 2
      $0.layer.shadowOffset = CGSize(width: 0, height: 0)
      $0.addSubview(titleLabel)
    }
    
    titleLabel.do {
      $0.font = UIFont.body_medium_16
      $0.textColor = UIColor(.mainColorBlue800)
      $0.numberOfLines = 2
      $0.textAlignment = .center
    }
  }
  
  override func setLayout() {
    buttonView.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(24)
      $0.trailing.equalToSuperview().inset(24)
      $0.height.equalTo(60)
      $0.centerX.equalToSuperview()
      $0.top.bottom.equalToSuperview()
    }
    titleLabel.snp.makeConstraints {
      $0.centerX.centerY.equalTo(buttonView)
    }
  }
  
  @objc private func didTap() { tapAction?() }
  
  func configure(title: String) {
    titleLabel.text = title
  }
}

#Preview {
  SimulationButton(title: "fl")
}
