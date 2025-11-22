//
//  FRoomFrontCardView.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/23/25.
//

import UIKit

import Then
import SnapKit

final class FRoomFrontCardView: BaseUIView {
    
    var location: String
    var monthMoney: Int
    var duration: String
    var roomNum: Int
    var toiletNum: Int
    var washingNum: Int
    
    private let image = UIImageView().then {
        $0.image = .room
        $0.contentMode = .scaleAspectFit
    }
    
    private let icon1 = UIImageView().then {
        $0.image = .markerIcon
    }
    
    private let icon2 = UIImageView().then {
        $0.image = .franceMoneyIcon
    }
    
    private let icon3 = UIImageView().then {
        $0.image = .calendarIcon
    }
    
    private let title1Label = UILabel().then {
        $0.text = "위치"
        $0.font = .head_semibold_16
        $0.textColor = .gray800
    }
    
    private let title2Label = UILabel().then {
        $0.text = "월세"
        $0.font = .head_semibold_16
        $0.textColor = .gray800
    }
    
    private let title3Label = UILabel().then {
        $0.text = "기간"
        $0.font = .head_semibold_16
        $0.textColor = .gray800
    }
    
    private lazy var data1Label = UILabel().then {
        $0.text = location
        $0.font = .body_regular_14
        $0.textColor = .gray800
    }
    
    private lazy var data2Label = UILabel().then {
        $0.text = "\(monthMoney)€"
        $0.font = .body_regular_14
        $0.textColor = .gray800
    }
    
    private lazy var data3Label = UILabel().then {
        $0.text = duration
        $0.font = .body_regular_14
        $0.textColor = .gray800
    }
    
    private let num1Label = UILabel().then {
        $0.text = "방 수"
        $0.font = .body_regular_12
        $0.textColor = .gray800
    }
    
    private let num2Label = UILabel().then {
        $0.text = "화장실 수"
        $0.font = .body_regular_12
        $0.textColor = .gray800
    }
    
    private let num3Label = UILabel().then {
        $0.text = "세탁기 수"
        $0.font = .body_regular_12
        $0.textColor = .gray800
    }
    
    private lazy var numData1Label = UILabel().then {
        $0.text = "\(roomNum)개"
        $0.font = .body_regular_14
        $0.textColor = .gray800
    }
    
    private lazy var numData2Label = UILabel().then {
        $0.text = "\(toiletNum)개"
        $0.font = .body_regular_14
        $0.textColor = .gray800
    }
    
    private lazy var numData3Label = UILabel().then {
        $0.text = "\(washingNum)개"
        $0.font = .body_regular_14
        $0.textColor = .gray800
    }
    
    private let divider1 = UIImageView().then {
        $0.image = .divider
    }
    
    private let divider2 = UIImageView().then {
        $0.image = .divider
    }
    
    init(location: String, monthMoney: Int, duration: String, roomNum: Int, toiletNum: Int, washingNum: Int) {
        self.location = location
        self.monthMoney = monthMoney
        self.duration = duration
        self.roomNum = roomNum
        self.toiletNum = toiletNum
        self.washingNum = washingNum
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubviews(image, icon1, icon2, icon3, title1Label, title2Label, title3Label, data1Label, data2Label, data3Label, num1Label, num2Label, num3Label, numData1Label, numData2Label, numData3Label, divider1, divider2)
    }
    
    override func setLayout() {
        image.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(208)
        }
        
        icon1.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(22)
            $0.leading.equalToSuperview().inset(16)
        }
        
        icon2.snp.makeConstraints {
            $0.top.equalTo(icon1.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(16)
        }
        
        icon3.snp.makeConstraints {
            $0.top.equalTo(icon2.snp.bottom).offset(35)
            $0.leading.equalToSuperview().inset(16)
        }
        
        title1Label.snp.makeConstraints {
            $0.leading.equalTo(icon1.snp.trailing).offset(5)
            $0.top.equalTo(icon1.snp.top).offset(3)
        }
        
        title2Label.snp.makeConstraints {
            $0.leading.equalTo(icon2.snp.trailing).offset(5)
            $0.top.equalTo(icon2.snp.top).offset(3)
        }
        
        title3Label.snp.makeConstraints {
            $0.leading.equalTo(icon3.snp.trailing).offset(5)
            $0.top.equalTo(icon3.snp.top).offset(3)
        }
        
        data1Label.snp.makeConstraints {
            $0.top.equalTo(title1Label.snp.bottom).offset(3)
            $0.leading.equalTo(title1Label.snp.leading)
        }
        
        data2Label.snp.makeConstraints {
            $0.top.equalTo(title2Label.snp.bottom).offset(3)
            $0.leading.equalTo(title2Label.snp.leading)
        }
        
        data3Label.snp.makeConstraints {
            $0.top.equalTo(title3Label.snp.bottom).offset(3)
            $0.leading.equalTo(title3Label.snp.leading)
        }
        
        num1Label.snp.makeConstraints {
            $0.top.equalTo(data3Label.snp.bottom).offset(16.5)
            $0.leading.equalToSuperview().inset(37.67)
        }
        
        divider1.snp.makeConstraints {
            $0.leading.equalTo(num1Label.snp.trailing).offset(39.67)
            $0.top.equalTo(data3Label.snp.bottom).offset(17.5)
        }
        
        num2Label.snp.makeConstraints {
            $0.top.equalTo(data3Label.snp.bottom).offset(16.5)
            $0.leading.equalTo(divider1.snp.trailing).offset(29.17)
        }
        
        divider2.snp.makeConstraints {
            $0.leading.equalTo(num2Label.snp.trailing).offset(29.17)
            $0.top.equalTo(data3Label.snp.bottom).offset(17.5)
        }
        
        num3Label.snp.makeConstraints {
            $0.top.equalTo(data3Label.snp.bottom).offset(16.5)
            $0.leading.equalTo(divider2.snp.trailing).offset(29.17)
        }
        
        numData1Label.snp.makeConstraints {
            $0.top.equalTo(num1Label.snp.bottom).offset(2)
            $0.centerX.equalTo(num1Label)
        }
        
        numData2Label.snp.makeConstraints {
            $0.top.equalTo(num2Label.snp.bottom).offset(2)
            $0.centerX.equalTo(num2Label)
        }
        
        numData3Label.snp.makeConstraints {
            $0.top.equalTo(num3Label.snp.bottom).offset(2)
            $0.centerX.equalTo(num3Label)
        }
    }
}
