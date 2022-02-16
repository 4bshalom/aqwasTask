//
//  ViewController.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import Foundation
import Alamofire

enum ResturantsNetworkRouter: URLRequestConvertible {
    
    case resturants
    
    var method: HTTPMethod {
        switch self {
            
        case .resturants:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .resturants:
            return nil
        }
    }
    
    var url: URL {
        let endpoint: String
        switch self {
        case .resturants:
            endpoint = Constants.RestaurantsEndpoints.resturants
        }
        return URL(string: Constants.baseURL)!.appendingPathComponent(endpoint)
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .resturants:
            return URLEncoding.default
        }
    }
}
