//
//  ResturantsCellSpy.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022
//

import Foundation
@testable import aqwasTask
final class ResturantsCellSpy: ResturantsCellPresentable {
    
    var configureCallCount = 0
    var passedItem: ResturantsModel.ViewModel!

    func configure(item: ResturantsModel.ViewModel) {
        configureCallCount += 1
        passedItem = item
    }
}
