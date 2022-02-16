//
//  UIImageViewExtension.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import Kingfisher
import UIKit

extension UIImageView {
    
    func load(url: URL?, placeholder: UIImage? = nil) {
            kf.indicatorType = .activity
            kf.setImage(with: url, placeholder: placeholder)
    }
}
