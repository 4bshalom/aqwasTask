//
//  ResturantsViewSpy.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022
//

import Foundation
@testable import aqwasTask
final class ResturantsViewSpy: ResturantsPresentation {

    
    
    var reloadDataCallCount = 0
    var showResturantDetailsCallCount = 0
    var showIndicatorCallCount = 0
    var hideIndicatorCallCount = 0
    var showErrorCallCount = 0
    
    var showResturantDetailsPassedItem: ResturantsModel.ViewModel!
    var passedErrorMessage: String!
    
    func reloadData() {
        reloadDataCallCount += 1
    }
    
    func showResturantDetails(with item: ResturantsModel.ViewModel) {
        showResturantDetailsCallCount += 1
        showResturantDetailsPassedItem = item
        
    }
    
    func showIndicator() {
        showIndicatorCallCount += 1
    }
    
    func hideIndicator() {
        hideIndicatorCallCount += 1
    }
    
    func showError(with errorMessage: String) {
        showErrorCallCount += 1
        passedErrorMessage = errorMessage
    }
}
