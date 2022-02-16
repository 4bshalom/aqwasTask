//
//  ResturantDetailsViewController.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 15/02/2022.
//

import UIKit

class ResturantDetailsViewController: UIViewController {
    
    private let resturantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let resturantNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    private let resturantDescLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let resturantHoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let resturantRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let resturant: ResturantsModel.ViewModel
    
    init(resturant: ResturantsModel.ViewModel) {
        self.resturant = resturant
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        setUpViews()
    }
    
    private func layoutUI() {
        view.backgroundColor = .white
        
        view.addSubview(resturantImageView)
        view.addSubview(resturantNameLabel)
        view.addSubview(resturantDescLabel)
        view.addSubview(resturantRatingLabel)
        view.addSubview(resturantHoursLabel)
        
        NSLayoutConstraint.activate([
            
            resturantImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            resturantImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            resturantImageView.heightAnchor.constraint(equalToConstant: 160),
            
            resturantNameLabel.topAnchor.constraint(equalTo: resturantImageView.bottomAnchor, constant: 16),
            resturantNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            resturantDescLabel.topAnchor.constraint(equalTo: resturantImageView.bottomAnchor, constant: 16),
            resturantDescLabel.leadingAnchor.constraint(equalTo: resturantNameLabel.trailingAnchor, constant: 16),
            resturantDescLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            resturantHoursLabel.topAnchor.constraint(equalTo: resturantDescLabel.bottomAnchor, constant: 16),
            resturantHoursLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resturantHoursLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            
            resturantRatingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            resturantRatingLabel.topAnchor.constraint(equalTo: resturantDescLabel.bottomAnchor, constant: 16),
            resturantRatingLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2)
            
        ])
    }
    
    func setUpViews() {
        
        title = resturant.name
        resturantImageView.load(url: resturant.image)
        resturantNameLabel.text = resturant.name
        resturantDescLabel.text = resturant.description
        resturantHoursLabel.text = resturant.hours
        resturantRatingLabel.text = "Rating: \(resturant.rating)"
    }
}

extension ResturantDetailsViewController {
    
    static func create(model: ResturantsModel.ViewModel) -> ResturantDetailsViewController {
        return .init(resturant: model)
    }
}
