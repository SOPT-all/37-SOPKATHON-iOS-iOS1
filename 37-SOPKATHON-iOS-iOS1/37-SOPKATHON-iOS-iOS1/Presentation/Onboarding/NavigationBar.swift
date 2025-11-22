//
//  NavigationBar.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class NavigationBar: BaseUIView {
  
  private let backButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setUI() {
    self.backgroundColor = .clear
    
    backButton.do {
      $0.setImage(UIImage.backButton, for: .normal)
      $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    addSubview(backButton)
  }
  
  override func setLayout() {
    backButton.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalToSuperview().offset(20)
      $0.width.equalTo(25)
      $0.height.equalTo(25)
    }
  }
  
  //MARK: - method

  @objc private func backButtonTapped() {
      parentViewController?.navigationController?.popViewController(animated: true)
  }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while let responder = parentResponder {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            parentResponder = responder.next
        }
        return nil
    }
}
