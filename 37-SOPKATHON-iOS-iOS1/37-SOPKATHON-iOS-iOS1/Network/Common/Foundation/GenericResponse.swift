//
//  GenericResponse.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/22/25.
//

import Foundation

struct GenericResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String
}
