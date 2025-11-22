//
//  ChooseToastMessage.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 10/31/25.
//

import UIKit

import Then
import SnapKit

final class ChooseToastMessage: BaseUIView {
    
    // MARK: - Properties
    
    private let titleLabel = UILabel().then {
        $0.textColor = .white0
        $0.font = .body_semibold_18
        $0.text = "당신의"
    }
    
    private let titleImage = UIImageView().then {
        $0.image = .xSmall
    }
    
    private let title2Label = UILabel().then {
        $0.textColor = .white0
        $0.font = .body_semibold_18
        $0.text = "방이 누군가에게 선택되었습니다."
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        backgroundColor = .gray500
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubviews(titleLabel, titleImage, title2Label)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(11.5)
            $0.centerY.equalToSuperview()
        }
        
        titleImage.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(2)
            $0.centerY.equalToSuperview()
        }
        
        title2Label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(84.5)
            $0.centerY.equalToSuperview()
        }
    }
}
extension ChooseToastMessage {
    func makeChooseToast(on view: UIView) {
        let toast = ChooseToastMessage()
        view.addSubview(toast)
        
        toast.alpha = 0
        toast.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(49)
            $0.height.equalTo(70)
            $0.width.equalTo(334)
        }
        
        UIView.animate(withDuration: 0.3) {
            toast.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 2){
                toast.alpha = 0
            } completion: { _ in
                toast.isHidden = true
            }
        }
    }
}
