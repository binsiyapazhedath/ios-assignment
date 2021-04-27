//
//  Utility.swift
//  ios-assignment
//
//  Created by Binsu on 27/04/2021.
//

import UIKit
import IHProgressHUD
import Reachability

class Utility {
    
    class func showProgress(withMessage message: String) {
        DispatchQueue.main.async {
            IHProgressHUD.set(defaultMaskType: .black)
            IHProgressHUD.set(borderColor: UIColor.init(named: "accentColor")!)
            IHProgressHUD.set(borderWidth: 1)
            IHProgressHUD.set(backgroundLayerColor: .white)
            IHProgressHUD.show(withStatus: message)
        }
    }
    
    class func showProgress() {
        DispatchQueue.main.async {
            IHProgressHUD.set(defaultMaskType: .black)
            IHProgressHUD.set(borderColor: UIColor.init(named: "accentColor")!)
            IHProgressHUD.set(borderWidth: 1)
            IHProgressHUD.set(backgroundLayerColor: .white)
            IHProgressHUD.show(withStatus: "Loading...")
        }
    }
    
    class func dismissProgress() {
        DispatchQueue.main.async {
            IHProgressHUD.dismiss()
        }
    }
    
    class func showSuccessSnackView(message: String, iconName: String)
    {
        print("Error")
    }
    
    class func showErrorSnackView(message: String)
    {
        print("Error")
    }

    class func isNetworkConnected() -> Bool
        {
            let reachability = try! Reachability()
            return reachability.connection != .unavailable
        }
}
