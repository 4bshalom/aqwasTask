//
//  ResturantsModel.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022
//

import Foundation
@testable import aqwasTask

extension ResturantsModel {
    
    static func response() -> Response {
        return .init(
            id: 0,
            name: "name",
            description: "description",
            hours: "hours",
            image: "image",
            rating: 0.0,
            distance: 0.0,
            hasOffer: false,
            offer: "offer"
        )
    }
    
}

extension ResturantsModel.ViewModel: Equatable {
    
    public static func == (lhs:  ResturantsModel.ViewModel, rhs:  ResturantsModel.ViewModel) -> Bool {
        return lhs.name == rhs.name
    }
    
}
