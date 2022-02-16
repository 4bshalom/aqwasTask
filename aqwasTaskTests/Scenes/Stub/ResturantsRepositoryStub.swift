//
//  ResturantsRepositoryStub.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022
//

import Foundation
@testable import aqwasTask

final class ResturantsRepositoryStub: ResturantsRepositoryProtocol {
    
    var resturantsResultToBeReturned: ResturantsResult!

    func getResturantsAsync() async throws -> [ResturantsModel.Response] {
        
        switch resturantsResultToBeReturned {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        case .none:
            fatalError()
        }
    }
    
}
