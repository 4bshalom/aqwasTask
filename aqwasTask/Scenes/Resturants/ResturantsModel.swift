//
//  ResturantsModel.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import Foundation

enum ResturantsModel {
    
    struct Request: Codable {
        
    }
    
    struct Response: Codable {
        let id: Int?
        let name, description, hours: String?
        let image: String?
        let rating: Double?
        let distance: Double?
        let hasOffer: Bool?
        let offer: String?
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case description
            case hours, image, rating, distance, hasOffer, offer
        }
        
    }
    
    struct ViewModel {
        
        let name: String
        let description: String
        let hours: String
        let image: URL?
        let rating: Double
        let distance: Double
        let hasOffer: Bool
        let offer: String
        
        init(_ model: Response) {
            name = model.name ?? ""
            description = model.description ?? ""
            hours = model.hours ?? ""
            image = URL(string: model.image ?? "")
            rating = model.rating ?? 0
            distance = model.distance ?? 0
            hasOffer = model.hasOffer ?? false
            offer = model.offer ?? ""
        }
    }
}
