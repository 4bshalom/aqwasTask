//
//  ResturantsViewController.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import UIKit

final class ResturantsViewController: UIViewController {
    
    var presenter: ResturantsPresenterInput!
    
    private lazy var collectionview: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: view.frame.width - 16, height: 200)
        
        var collectionview = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(ResturantsCell.self)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = .white
        return collectionview
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        Task {
            await presenter.getResturants()
        }
    }
    
    private func layoutUI() {
        title = "Resturants"
        view.addSubview(collectionview)
        let sortingButton = UIBarButtonItem(
                    primaryAction: UIAction(
                        image: UIImage(named: "ic_sort")?.withRenderingMode(.alwaysOriginal),
                        handler: { [weak self] _ in
                            guard let self = self else { return }
                            self.presenter.didTapSorting()
                        }
                    ))
        navigationItem.rightBarButtonItem = sortingButton
    }
}

extension ResturantsViewController: ResturantsPresentation {
    
    func showResturantDetails(with item: ResturantsModel.ViewModel) {
        push(ResturantDetailsViewController.init(resturant: item))
    }
    
    func reloadData() {
        collectionview.reloadData()
    }
}

extension ResturantsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ResturantsCell = collectionview.dequeueCell(for: indexPath)
        presenter.configure(cell: cell, at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectCell(at: indexPath)
    }
}

extension ResturantsViewController {
    
    static func create() -> ResturantsViewController {
        
        let viewController = ResturantsViewController()
        let resturantsRepository = ResturantsRepository()
        let presenter = ResturantsPresenter(
            view: viewController,
            resturantsRepository: resturantsRepository
        )
        viewController.presenter = presenter
        
        return viewController
    }
}
