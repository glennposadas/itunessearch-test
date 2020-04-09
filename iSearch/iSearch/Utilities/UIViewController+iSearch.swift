//
//  UIViewController+iSearch.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import UIKit

var windowScene: UIScene = {
    let windowScene = UIApplication.shared
    .connectedScenes
    .filter { $0.activationState == .foregroundActive }
    .first
    return windowScene!
}()

var windowRootController: UIViewController? {
    (windowScene as! UIWindowScene).windows.last?.rootViewController
}

/// Category for any controller.
extension UIViewController {
    /// The completion callback for the ```alert```.
    typealias AlertCallBack = ((_ userDidTapOk: Bool) -> Void)
        
    /// Class function to get the current or top most screen.
    class func current(controller: UIViewController? = windowRootController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return current(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return current(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return current(controller: presented)
        }
        return controller
    }
    
    /**
     Presents an alertController with completion.
     - parameter title: The title of the alert.
     - parameter message: The body of the alert, nullable, since we can just sometimes use the title parameter.
     - parameter okButtonTitle: the title of the okay button.
     - parameter cancelButtonTitle: The title of the cancel button, defaults to nil, nullable.
     - parameter completion: The ```LLFAlertCallBack```, returns Bool. True when the user taps on the OK button, otherwise false.
     */
    func alert(
        title: String,
        message: String? = nil,
        okayButtonTitle: String,
        cancelButtonTitle: String? = nil,
        withBlock completion: AlertCallBack?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okayButtonTitle, style: .default) { _ in
            completion?(true)
        }
        alertController.addAction(okAction)
        
        if let cancelButtonTitle = cancelButtonTitle {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .default) { _ in
                completion?(false)
            }
            alertController.addAction(cancelAction)
        }
        
        alertController.view.tintColor = .black
        present(alertController, animated: true, completion: nil)
    }
}
