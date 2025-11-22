//
//  FlagPlusAPI.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/22/25.
//

import Foundation

import Moya

enum XRoomAPI {
    case roomInfo(roomId: Int)
}

extension XRoomAPI: BaseTargetType {

    var path: String {
        switch self {
        case .roomInfo(let roomId):
            return "/rooms/\(roomId)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .roomInfo:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .roomInfo(_):
            return .requestPlain
        }
    }
}

//// 실제로 사용할 때 이런식으로 사용하시면됩니다.

//func sendFlagToServer() {
//        let provider = MoyaProvider<FlagPlusAPI>()
//
//        // Create a FlagPlus object with appropriate data
//        let flagData = FlagPlus(
//            name: FlagPlusInfo.shared.name,
//            dates: FlagPlusInfo.shared.dates,
//            guestNames: FlagPlusInfo.shared.guestId,
//            memo: FlagPlusInfo.shared.memo,
//            minTime: FlagPlusInfo.shared.minTime,
//            place: FlagPlusInfo.shared.place,
//            possibleDates: FlagPlusInfo.shared.possibleDates, // UNIX timestamps
//            timeSlot: FlagPlusInfo.shared.timeSlot
//        )
//
//        // Make the API request
//    provider.request(.setFlag(body: flagData)) { result in
//        switch result {
//        case .success(let response):
//            // Handle successful response
//            let statusCode = response.statusCode
//            print("Status Code: \(statusCode)")
//            // Process the response data as needed
//
//        case .failure(let error):
//            // Handle network error
//            print("Network Error: \(error)")
//        }
//    }
//
//    }
//}
