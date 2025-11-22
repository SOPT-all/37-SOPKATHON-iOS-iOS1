//
//  ClosenessSlider.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class ClosenessSlider: BaseUIView {
    
    // MARK: - UI Components
    
    let slider = UISlider().then {
        $0.minimumValue = 0
        $0.maximumValue = 100
        $0.minimumTrackTintColor = .mainColorBlue
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        self.backgroundColor = .clear
        self.addSubview(slider)
    }
    
    override func setLayout() {
        slider.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
}

