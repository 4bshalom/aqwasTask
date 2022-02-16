//
//  UIViewExtension.swift
//  aqwasTask
//
//  Created by Abshalom Salama on 14/02/2022.
//

import UIKit
import MBProgressHUD

extension UIView {
    
    func showActivityIndicator(isUserInteractionEnabled: Bool) {
        DispatchQueue.main.async {
            let hud = MBProgressHUD.showAdded(to: self, animated: true)
            hud.isUserInteractionEnabled = !isUserInteractionEnabled
            hud.restorationIdentifier = "activityIndicator"
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            for subview in self.subviews where subview.restorationIdentifier == "activityIndicator" {
                guard let hud = subview as? MBProgressHUD else { return }
                hud.hide(animated: true)
            }
        }
    }
}
