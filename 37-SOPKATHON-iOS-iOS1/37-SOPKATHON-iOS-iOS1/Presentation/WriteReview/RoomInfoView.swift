//
//  RoomInfoView.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//

import UIKit

import SnapKit
import Then

protocol RoomInfoViewDelegate: AnyObject {
    func roomInfoViewRequestPresent(_ viewControllerToPresent: UIViewController)
    func roomInfoViewRequestDismiss(_ viewControllerToDismiss: UIViewController)
    func roomInfoViewAddRecord()
}


final class RoomInfoView: BaseUIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: RoomInfoViewDelegate?
    
    // MARK: - Properties
    
    private var roomCount: Int = 0
    private var restroomCount: Int = 0
    private var laundryCount: Int = 0
    
    private let imageUploadLabel = UILabel().then {
        $0.font = .head_semibold_18
        $0.textColor = .gray800
        $0.text = "방 이미지 업로드"
    }
    
    private let detailImageLabel = UILabel().then {
        $0.font = .body_medium_16
        $0.textColor = .gray500
        $0.text = "상세 사진"
    }
    
    private let addPhotoButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray300.cgColor
        $0.backgroundColor = .gray400
        $0.setTitle("집 사진 추가", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .body_medium_16
    }
    
    private let roomImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.isHidden = true
    }
    
    private let monthlyFeeLabel = UILabel().then {
        $0.font = .head_semibold_18
        $0.textColor = .gray800
        $0.text = "월세"
    }
    
    private let monthlyFeeTextField = UITextField().then {
        $0.placeholder = "월세를 입력해주세요"
        $0.attributedPlaceholder = NSAttributedString(string: "월세를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray700])
        $0.borderStyle = .none
        $0.layer.cornerRadius = 6
        $0.backgroundColor = .gray100
        $0.font = .body_regular_14
        $0.textColor = .gray700
        $0.addLeftPadding()
    }
    
    private let houseStatusChoiceLabel = UILabel().then {
        $0.font = .head_semibold_18
        $0.textColor = .gray800
        $0.text = "내 집 상태 선택"
    }
    
    private let counterBackgroundView = UIView().then {
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 6
    }
    
    private let roomCounterView = CounterView(itemName: "방 수  ")
    private let restroomCounterView = CounterView(itemName: "화장실 수")
    private let laundryCounterView = CounterView(itemName: "세탁기 수")
    
    private let periodLabel = UILabel().then {
        $0.font = .head_semibold_18
        $0.textColor = .gray800
        $0.text = "기간"
    }
    
    private let periodTextField = UITextField().then {
        $0.placeholder = "기간을 입력해주세요"
        $0.attributedPlaceholder = NSAttributedString(string: "기간을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray700])
        $0.borderStyle = .none
        $0.layer.cornerRadius = 6
        $0.backgroundColor = .gray100
        $0.font = .body_regular_14
        $0.textColor = .gray700
        $0.addLeftPadding()
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
    
    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .clear
        
        
        addSubviews(
            imageUploadLabel,
            detailImageLabel,
            addPhotoButton,
            roomImageView,
            monthlyFeeLabel,
            monthlyFeeTextField,
            houseStatusChoiceLabel,
            counterBackgroundView,
            roomCounterView,
            restroomCounterView,
            laundryCounterView,
            periodLabel,
            periodTextField
        )
        
        roomCounterView.delegate = self
        restroomCounterView.delegate = self
        laundryCounterView.delegate = self
        
        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
    }
    
    override func setLayout() {
        
        imageUploadLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        
        detailImageLabel.snp.makeConstraints {
            $0.top.equalTo(imageUploadLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        addPhotoButton.snp.makeConstraints {
            $0.top.equalTo(detailImageLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(97)
        }
        
        roomImageView.snp.makeConstraints {
            $0.edges.equalTo(addPhotoButton)
        }
        
        monthlyFeeLabel.snp.makeConstraints {
            $0.top.equalTo(roomImageView.snp.bottom).offset(22)
            $0.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        
        monthlyFeeTextField.snp.makeConstraints {
            $0.top.equalTo(monthlyFeeLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(34)
        }
        
        houseStatusChoiceLabel.snp.makeConstraints {
            $0.top.equalTo(monthlyFeeTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        
        counterBackgroundView.snp.makeConstraints {
            $0.top.equalTo(monthlyFeeTextField.snp.bottom).offset(20)
            $0.width.equalTo(187)
            $0.height.equalTo(147)
            $0.trailing.equalTo(monthlyFeeTextField)
        }
        
        roomCounterView.snp.makeConstraints {
            $0.top.equalTo(houseStatusChoiceLabel.snp.top).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        restroomCounterView.snp.makeConstraints {
            $0.top.equalTo(roomCounterView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        laundryCounterView.snp.makeConstraints {
            $0.top.equalTo(restroomCounterView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        periodLabel.snp.makeConstraints {
            $0.top.equalTo(counterBackgroundView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        
        periodTextField.snp.makeConstraints {
            $0.top.equalTo(periodLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(34)
            $0.bottom.equalToSuperview()
        }
    }
    
    @objc private func addPhotoButtonTapped() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        delegate?.roomInfoViewRequestPresent(picker)
    }
    
    // MARK: - Internal Methods
    
    func updateRoomImage(_ image: UIImage) {
        self.roomImageView.image = image
        self.roomImageView.isHidden = false
        self.addPhotoButton.setImage(nil, for: .normal)
        self.addPhotoButton.layer.borderWidth = 0
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            updateRoomImage(selectedImage)
        }
        
        delegate?.roomInfoViewRequestDismiss(picker)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        delegate?.roomInfoViewRequestDismiss(picker)
    }
}
extension RoomInfoView: CounterViewDelegate {
    func counterViewDidUpdateValue(for item: String, value: Int) {
        switch item {
        case "방 수":
            roomCount = value
        case "화장실 수":
            restroomCount = value
        case "세탁기 수":
            laundryCount = value
        default:
            break
        }
    }
}

#Preview {
    WriteReviewViewController()
}
