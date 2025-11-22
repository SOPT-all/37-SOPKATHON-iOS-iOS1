//
//  RoomInfoDTO.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//

import Foundation

struct RoomInfoDTO: Codable {
    let location: String
    let monthlyRent: Int
    let roomCount: Int
    let bathroomCount: Int
    let period: String
    let intimacy: Int
    let homeFrequency: String
    let drinkingCapacity: String
    let cleanliness: String
    let smoke: String
    let description: String
    let washerCount: Int
}
