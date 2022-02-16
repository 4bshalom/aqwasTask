//
//  ResturantsTableViewCell.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import UIKit

protocol ResturantsCellPresentable: AnyObject {
    func configure(item: ResturantsModel.ViewModel)
}

final class ResturantsCell: UICollectionViewCell {
    
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
        return label
    }()
    
    private let resturantDistanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .green
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(resturantImageView)
        addSubview(resturantNameLabel)
        addSubview(resturantDistanceLabel)
        
        NSLayoutConstraint.activate([
            
            resturantImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            resturantImageView.widthAnchor.constraint(equalTo: widthAnchor),
            resturantImageView.heightAnchor.constraint(equalToConstant: 160),
            
            resturantNameLabel.topAnchor.constraint(equalTo: resturantImageView.bottomAnchor, constant: 8),
            resturantNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            resturantDistanceLabel.topAnchor.constraint(equalTo: resturantImageView.bottomAnchor, constant: 8),
            resturantDistanceLabel.bottomAnchor.constraint(equalTo: resturantNameLabel.bottomAnchor),
            resturantDistanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            resturantDistanceLabel.leadingAnchor.constraint(equalTo: resturantNameLabel.trailingAnchor, constant: 16),
            resturantDistanceLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
}

extension ResturantsCell: ResturantsCellPresentable {
    
    func configure(item: ResturantsModel.ViewModel) {
        
        resturantImageView.load(url: item.image)
        
        resturantNameLabel.text = item.name
        
        let distanceString = String(format: "%.2f", item.distance)
        resturantDistanceLabel.text =  "\(distanceString)  km Away"
    }
}

