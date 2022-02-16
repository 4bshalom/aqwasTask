//
//  UIViewControllerExtension.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import UIKit

extension UIViewController {
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
