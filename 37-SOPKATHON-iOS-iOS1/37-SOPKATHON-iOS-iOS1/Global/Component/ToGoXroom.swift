//
//  ToGoXroom.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 박정환 on 11/23/25.
//

import UIKit

import SnapKit
import Then

protocol ToGoXroomViewDelegate: AnyObject {
    func toGoButtonTapped()
}

final class ToGoXroomView: UIView {
    weak var delegate: ToGoXroomViewDelegate?
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 334, height: 99)
    }

    // MARK: - UI Components
    
    private let iconImageView = UIImageView().then {
        $0.image = .xBig
        $0.contentMode = .scaleAspectFit
        $0.image = $0.image?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .white
    }
    
    private let firstLineLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .head_semibold_18
        $0.text = "방과의 추억을"
    }

    private let secondLineLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .head_semibold_18
        $0.text = "정리하시나요?"
    }
    
    let goButton = UIButton().then {
        $0.setTitle("쓰러가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .body_regular_14
        $0.backgroundColor = .gray300
        $0.layer.cornerRadius = 4
        $0.addTarget(self, action: #selector(goButtonDidTap), for: .touchUpInside)
    }

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        setupStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        addSubview(iconImageView)
        addSubview(firstLineLabel)
        addSubview(secondLineLabel)
        addSubview(goButton)
    }
    
    private func setupLayout() {
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(21)
            $0.width.height.equalTo(26) // 필요에 따라 조절
        }
        
        firstLineLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing)
            $0.bottom.equalTo(iconImageView.snp.bottom)
            $0.trailing.lessThanOrEqualTo(goButton.snp.leading).offset(-10)
        }
        
        secondLineLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView)
            $0.top.equalTo(iconImageView.snp.bottom).offset(4)
            $0.trailing.lessThanOrEqualTo(goButton.snp.leading).offset(-10)
        }
        
        goButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(68)
            $0.height.equalTo(30)
        }
    }
    
    private func setupStyle() {
        backgroundColor = .gray500
        layer.cornerRadius = 10
        clipsToBounds = true
    }

    @objc private func goButtonDidTap() {
        delegate?.toGoButtonTapped()
    }
}
