//
//  AppDelegate.swift
//  FenixAssignment
//
//  Created by Q.M.S on 01/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: screenSize)
        let viewModel = MovieSearchViewModel()
        let vc = MovieSearchViewController.instantiate()
        vc.viewModel = viewModel
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
    }


}

