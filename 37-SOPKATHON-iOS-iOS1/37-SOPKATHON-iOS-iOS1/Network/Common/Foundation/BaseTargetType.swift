//
//  BaseTargetType.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by 김나연 on 11/22/25.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType{

    var baseURL: URL {
        return URL(string: "http://13.125.126.206")!
    }

    var headers: [String : String]? {
        let header = [
            "Content-Type": "application/json"
        ]
        return header
    }

    var sampleData: Data {
        return Data()
    }
}
