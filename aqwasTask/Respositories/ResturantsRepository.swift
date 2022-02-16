//
//  ResturantsModel.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import Foundation

typealias ResturantsResult = Result<[ResturantsModel.Response], Error>

protocol ResturantsRepositoryProtocol {

    func getResturantsAsync() async throws -> [ResturantsModel.Response]
}

class ResturantsRepository: ResturantsRepositoryProtocol {
 
    
    
func getResturantsAsync() async throws -> [ResturantsModel.Response] {
        
        do {
            let request = ResturantsNetworkRouter.resturants
             let data =  try await NetworkLayer.request(request)
            return try JSONDecoder().decode([ResturantsModel.Response].self, from: data)

        } catch {
            throw error
        }
    }
    
}
