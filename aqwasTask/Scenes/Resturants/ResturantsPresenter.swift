//
//  ResturantsPresenter.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import Foundation

protocol ResturantsPresentation: ViewDisplayable {
    func reloadData()
    func showResturantDetails(with item: ResturantsModel.ViewModel)
}

// MARK: Presenter Input

protocol ResturantsPresenterInput {
    
    var numberOfRows: Int { get }
    
    func getResturants() async
    func configure(cell: ResturantsCellPresentable, at indexPath: IndexPath)
    func didSelectCell(at indexPath: IndexPath)
    func didTapSorting()
}

final class ResturantsPresenter: ResturantsPresenterInput {
    
    private weak var view: ResturantsPresentation?
    private let resturantsRepository: ResturantsRepositoryProtocol
    private var items = [ResturantsModel.ViewModel]() { didSet { sortedItems = items } }
    private var sortedItems = [ResturantsModel.ViewModel]() { didSet { view?.reloadData() } }
    private var isSorted = false
    
    init(
        view: ResturantsPresentation,
        resturantsRepository: ResturantsRepositoryProtocol
    ) {
        self.view = view
        self.resturantsRepository = resturantsRepository
    }
    
    var numberOfRows: Int { return sortedItems.count }
    
    func configure(cell: ResturantsCellPresentable, at indexPath: IndexPath) {
        cell.configure(item: sortedItems[indexPath.row])
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        view?.showResturantDetails(with: sortedItems[indexPath.row])
    }
    
    func didTapSorting() {
        if isSorted {
            sortedItems = items
        } else {
            sortedItems = items.sorted(by: { $0.distance < $1.distance })
        }
        isSorted.toggle()
    }
    
    func getResturants() async {
        await getAllResturants()
    }
    
    
    private func getAllResturants() async {

        view?.showIndicator()
        do {
            let items = try await resturantsRepository.getResturantsAsync()
            await MainActor.run {
                self.view?.hideIndicator()
                self.items = items.map { ResturantsModel.ViewModel($0) }
            }
        } catch {
            self.view?.hideIndicator()
            view?.showError(with: error.localizedDescription)
        }
    }
}
