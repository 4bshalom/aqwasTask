//
//  UICollectionViewExtension
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import UIKit

extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(
            withReuseIdentifier: T.className,
            for: indexPath
        ) as! T
    }
    
    func register<T: UICollectionViewCell>(_ cell: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.className)
    }
}

