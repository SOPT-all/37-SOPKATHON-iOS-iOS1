//
//  ToastMessage.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 10/31/25.
//

import UIKit

import Then
import SnapKit

final class ToastMessage: BaseUIView {
    
    // MARK: - Properties
    
    private lazy var titleLabel = UILabel().then {
        $0.textColor = .white0
        $0.font = .body_regular_14
        $0.text = title
    }
    private let toastImage = UIImageView().then {
        $0.image = .call
    }
    private var title: String
    
    
    // MARK: - Init
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        backgroundColor = .gray500
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubviews(titleLabel, toastImage)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(toastImage.snp.trailing).offset(10)
        }
        
        toastImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(37)
            $0.centerY.equalToSuperview()
        }
    }
    
    func updateTitle(_ newTitle: String) {
        titleLabel.text = newTitle
    }
}
extension ToastMessage {
    func makeToast(on view: UIView, message: String){
        let toast = ToastMessage(title: message)
        view.addSubview(toast)
        
        toast.alpha = 0
        toast.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(132)
            $0.height.equalTo(40)
            $0.width.equalTo(265)
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
