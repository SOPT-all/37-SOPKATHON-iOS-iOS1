//
//  CounterView.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//

import UIKit

import SnapKit
import Then

protocol CounterViewDelegate: AnyObject {
    func counterViewDidUpdateValue(for item: String, value: Int)
}

final class CounterView: BaseUIView {
    
    weak var delegate: CounterViewDelegate?
    
    private let itemLabel = UILabel().then {
        $0.font = .head_semibold_16
        $0.textColor = .gray800
        $0.textAlignment = .left
    }
    
    private let minusButton = UIButton().then {
        $0.setImage(.minus, for: .normal)
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 4
        $0.isEnabled = false
    }
    
    private let countLabel = UILabel().then {
        $0.font = .head_semibold_16
        $0.textColor = .gray800
        $0.textAlignment = .center
        $0.text = "0"
    }
    
    private let plusButton = UIButton().then {
        $0.setImage(.plus, for: .normal)
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 4
    }
    
    private var currentValue: Int = 0
    private var itemName: String = ""
    private let maxValue: Int = 10
    
    // MARK: - Init
    
    init(itemName: String) {
        super.init(frame: .zero)
        self.itemName = itemName
        itemLabel.text = itemName
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        addSubviews(itemLabel, minusButton, countLabel, plusButton)
    }
    
    override func setLayout() {
        
        let buttonSize: CGFloat = 28
        let horizontalSpacing: CGFloat = 10
        
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
            $0.size.equalTo(buttonSize)
        }
        
        countLabel.snp.makeConstraints {
            $0.trailing.equalTo(plusButton.snp.leading).offset(-horizontalSpacing)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(20)
        }
        
        minusButton.snp.makeConstraints {
            $0.trailing.equalTo(countLabel.snp.leading).offset(-horizontalSpacing)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(buttonSize)
        }
        
        itemLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(165)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Action Methods
    
    @objc private func plusButtonTapped() {
        if currentValue < maxValue {
            currentValue += 1
            updateUI()
        }
    }
    
    @objc private func minusButtonTapped() {
        if currentValue > 0 {
            currentValue -= 1
            updateUI()
        }
    }
    
    // MARK: - Internal Methods
    
    private func updateUI() {
        countLabel.text = "\(currentValue)"
        
        minusButton.isEnabled = currentValue > 0
        plusButton.isEnabled = currentValue < maxValue
        
        delegate?.counterViewDidUpdateValue(for: itemName, value: currentValue)
    }
}
