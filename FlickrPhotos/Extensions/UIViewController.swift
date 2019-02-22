//
//  UIViewController.swift
//  FlickrPhotos
//
//  Created by allzone on 2/20/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
    
    // MARK: HUD indicator utils
    func showHUD(animated: Bool = true) {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultStyle(.dark)
    }
    
    func hideHUD(animated: Bool = true) {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    // MARK: Alert utils
    func showErrorAlert(message: String?) {
        SVProgressHUD.showError(withStatus: message ?? "")
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.gradient)
        SVProgressHUD.setMinimumDismissTimeInterval(2)
    }
    
    func showAlertErrorIfNeeded(error: Error?) {
        if let e = error {
            showErrorAlert(message: e.localizedDescription)
        }
    }
}
