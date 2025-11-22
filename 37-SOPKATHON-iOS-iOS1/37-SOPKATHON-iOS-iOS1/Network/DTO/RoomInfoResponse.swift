//
//  FlagPlus.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/22/25.
//

struct RoomInfoResponse: Codable {
    let code: Int
    let message: String
    let data: RoomInfo
}

struct RoomInfo: Codable {
    let location: String
    let monthlyRent: Int
    let period: String
    let roomCount: Int
    let bathroomCount: Int
    let washerCount: Int
}
