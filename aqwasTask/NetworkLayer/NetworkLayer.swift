//
//  ViewController.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import Foundation
import Alamofire

enum NetworkError: Error, LocalizedError {
    case noDataAvailable
    var errorDescription: String? {
        switch self {
        case .noDataAvailable:
            return "No Data Available"
        }
    }
}

class NetworkLayer {
    class  func request(_ request: URLRequestConvertible) async throws -> Data {
        let response = await AF.request(request).serializingData().response
        
        switch response.result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
}
