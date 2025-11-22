//
//  ButtonType.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

enum CustomButtonType: CaseIterable {
  case newMember
  case existingMember
  case cardInquiry
  case recommendRoom
  case createXIntro
  case xRoomInquiry
}

extension CustomButtonType {
  var title: String {
    switch self {
    case .newMember: return "신규 회원"
    case .existingMember: return "기존 회원"
    case .cardInquiry: return "문의하기"
    case .recommendRoom: return "비슷한 다른방도 추천"
    case .createXIntro: return "X소개서 생성"
    case .xRoomInquiry: return "문의하기"
    }
  }
  
  var width: CGFloat {
    switch self {
    case .cardInquiry: return 272
    case .newMember, .existingMember, .recommendRoom, .createXIntro, .xRoomInquiry: return 335
      
    }
  }
  
  var height: CGFloat {
    switch self {
    case .cardInquiry: return 37
    case .newMember, .existingMember, .recommendRoom, .createXIntro, .xRoomInquiry: return 50
    }
  }
  
  var fontColor: UIColor {
    switch self {
    case .newMember, .createXIntro, .xRoomInquiry, .recommendRoom:
      return .white
    case .existingMember:
      return .mainColorRed
    case .cardInquiry:
      return .gray500
    }
  }
  
  var backgroundColor: UIColor {
    switch self {
    case .newMember, .createXIntro:
      return .mainColorRed
    case .existingMember, .cardInquiry:
      return .white
    case .recommendRoom:
      return .mainColorBlue600
    case .xRoomInquiry:
      return .mainColorBlue
    }
  }
}
