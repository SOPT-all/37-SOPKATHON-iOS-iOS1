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
  case anotherRoom
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
    case .anotherRoom: return "다른 방 추천받기"
    }
  }
  
  var width: CGFloat {
    switch self {
    case .cardInquiry: return 272
    case .newMember, .existingMember, .recommendRoom, .createXIntro, .xRoomInquiry, .anotherRoom: return 335
      
    }
  }
  
  var height: CGFloat {
    switch self {
    case .cardInquiry: return 37
    case .newMember, .existingMember, .recommendRoom, .createXIntro, .xRoomInquiry, .anotherRoom: return 50
    }
  }
  
  var fontColor: UIColor {
    switch self {
    case .newMember, .createXIntro, .xRoomInquiry, .recommendRoom:
      return .white0
    case .existingMember:
      return .mainColorRed
    case .cardInquiry:
      return .gray500
    case .anotherRoom:
      return .black0
    }
  }
  
  var backgroundColor: UIColor {
    switch self {
    case .newMember, .createXIntro:
      return .mainColorRed
    case .existingMember, .cardInquiry:
      return .white0
    case .recommendRoom:
      return .mainColorBlue600
    case .xRoomInquiry:
      return .mainColorBlue
    case .anotherRoom:
      return .gray000
    }
  }
}
