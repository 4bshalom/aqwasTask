//
//  ResturantsPresenter.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022
//

import XCTest
@testable import aqwasTask

class ResturantsPresenterTests: XCTestCase {
    
    var viewSpy: ResturantsViewSpy!
    var resturantsRepositoryStub: ResturantsRepositoryStub!
    var presenter: ResturantsPresenter!
    var resturantsCellSpy: ResturantsCellSpy!
    
    override func setUp() async throws {
        try await super.setUp()
        
        viewSpy = ResturantsViewSpy()
        resturantsRepositoryStub = ResturantsRepositoryStub()
        resturantsCellSpy = ResturantsCellSpy()
        
        presenter = ResturantsPresenter(
            view: viewSpy,
            resturantsRepository: resturantsRepositoryStub
        )
    }
    
    override func tearDown() async throws {
        viewSpy = nil
        resturantsRepositoryStub = nil
        resturantsCellSpy = nil
        presenter = nil
        try await super.tearDown()
    }
    
    func testGetResturantsSuccess() async throws {
        //Give
        let expextedItems = [ResturantsModel.ViewModel(ResturantsModel.response())]
        resturantsRepositoryStub.resturantsResultToBeReturned = .success([ResturantsModel.response()])

        //When
        await presenter.getResturants()

        //Then
        XCTAssertEqual(viewSpy.showIndicatorCallCount, 1)
        XCTAssertEqual(viewSpy.reloadDataCallCount, 1)
        XCTAssertEqual(viewSpy.hideIndicatorCallCount, 1)
        XCTAssertEqual(presenter.numberOfRows, expextedItems.count)
    }
    
    
    func testGetResturantsFail() async throws {
        
        //Give
        let expextedError = NetworkError.noDataAvailable
        resturantsRepositoryStub.resturantsResultToBeReturned = .failure(expextedError)
        
        //When
        await presenter.getResturants()
        
        //Then
        XCTAssertEqual(viewSpy.showIndicatorCallCount, 1)
        XCTAssertEqual(viewSpy.hideIndicatorCallCount, 1)
        XCTAssertEqual(viewSpy.showErrorCallCount, 1)
        
        XCTAssertEqual(viewSpy.passedErrorMessage, expextedError.localizedDescription)
    }
    
    
    func testConfigureCell() async throws {
        
        //Give
        let expextedItems = [ResturantsModel.ViewModel(ResturantsModel.response())]
        let indexPath = IndexPath(row: 0, section: 0)
        resturantsRepositoryStub.resturantsResultToBeReturned = .success([ResturantsModel.response()])
        
        //When
        await presenter.getResturants()
        presenter.configure(cell: resturantsCellSpy, at: indexPath)
        
        //Then
        XCTAssertEqual(viewSpy.showIndicatorCallCount, 1)
        XCTAssertEqual(viewSpy.reloadDataCallCount, 1)
        XCTAssertEqual(viewSpy.hideIndicatorCallCount, 1)
        
        XCTAssertEqual(presenter.numberOfRows, expextedItems.count)
        
        XCTAssertEqual(resturantsCellSpy.configureCallCount, 1)
        XCTAssertEqual(resturantsCellSpy.passedItem, expextedItems[indexPath.row])
    }
}
