//
//  PostRoomResponse.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//

import Foundation

struct PostRoommateResponse: Codable {
    let code: Int
    let message: String
    let data: PostRoommateData?
    
    struct PostRoommateData: Codable {
        let roomId: Int
        let roommateInfoId: Int 
        let content: String
    }
}
