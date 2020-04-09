//
//  SceneDelegate.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let splitViewController =  BaseSplitViewController()
        splitViewController.delegate = self
        let masterVC = SearchMasterViewController()
        let detailVC = SearchDetailViewController()
        let masterNavController = UINavigationController(rootViewController: masterVC)
        let detailNavController = UINavigationController(rootViewController: detailVC)
        splitViewController.viewControllers = [masterNavController,detailNavController]
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = splitViewController
        self.window?.makeKeyAndVisible()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

// MARK: - UISplitViewControllerDelegate

extension SceneDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

