//
//  RoomService.swift
//  37-SOPKATHON-iOS-iOS1
//
//  Created by mandoo on 11/23/25.
//

import Foundation
import Moya

final class RoomService {
    private let provider = MoyaProvider<RoomAPI>()
    
    func postRoommateInfo(
        body: RoomInfoDTO,
        completion: @escaping (Result<PostRoommateResponse, Error>) -> Void
    ) {
        provider.request(.postRoomInfo(body: body)) { result in
            switch result {
            case .success(let response):
                guard (200...299).contains(response.statusCode) else {
                    print("🚨 API Error Status Code: \(response.statusCode)")
                    do {
                        let errorResponse = try response.map(PostRoommateResponse.self)
                        completion(.failure(APIError.serverError(message: errorResponse.message)))
                    } catch {
                        completion(.failure(APIError.unknownError))
                    }
                    return
                }
                
                do {
                    let decodedData = try response.map(PostRoommateResponse.self)
                    completion(.success(decodedData))
                } catch {
                    print("🚨 Decoding Error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
                
            case .failure(let error):
                print("🚨 Network Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}

enum APIError: Error {
    case serverError(message: String)
    case unknownError
}
