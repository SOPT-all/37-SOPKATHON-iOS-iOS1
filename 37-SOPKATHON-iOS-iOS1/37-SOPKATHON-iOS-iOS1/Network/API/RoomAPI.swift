//
//  RoomAPI.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//

import Foundation

import Moya

enum RoomAPI {
    case postRoomInfo(body: RoomInfoDTO)
}

extension RoomAPI: BaseTargetType {
    var path: String {
        switch self {
        case .postRoomInfo:
            return "/rooms"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postRoomInfo:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .postRoomInfo(let body):
            return .requestJSONEncodable(body)
        }
    }
}
