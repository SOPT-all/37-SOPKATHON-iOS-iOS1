//
//  RoommateResponse.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 이서현 on 11/23/25.
//


struct RoommateResponse: Decodable {
    let code: Int
    let message: String
    let data: XRoommateData?
}

struct XRoommateData: Decodable {
    let content: String
}
