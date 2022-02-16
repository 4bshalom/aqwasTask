//
//  ViewDisplayble.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import UIKit

typealias EmptyClosure = () -> Void

protocol ViewDisplayable: AnyObject {
    
    func showIndicator()
    func hideIndicator()
    func showError(with errorMessage: String)
}

extension ViewDisplayable where Self: UIViewController {

    func showIndicator() {
        view.showActivityIndicator(isUserInteractionEnabled: false)
    }
    
    func hideIndicator() {
        view.hideActivityIndicator()
    }
    
    func showError(with errorMessage: String) {
        
        AlertBuilder(title: "", message: errorMessage, preferredStyle: .alert)
            .addAction(title: "Okay", style: .default, handler: nil)
            .build()
            .show()
    }
}
