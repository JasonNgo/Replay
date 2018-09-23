//
//  MainTabBarController.swift
//  Replay
//
//  Created by Jason Ngo on 2018-09-19.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

// DEBUG: print("Function: \(#function), called starting from line: \(#line)")

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainTabBarController()
        setupTarBarControllers()
    }
    
}

// MARK: - Helper Functions
private extension MainTabBarController {
    
    // setup the TarBarController stylings
    private func setupMainTabBarController() {
        view.backgroundColor = .white
    }
    
    // setup TarBarItem Controllers
    private func setupTarBarControllers() {
        let layout = UICollectionViewFlowLayout()
        let videosVC = VideosFeedController(collectionViewLayout: layout)
        let videosNavVC = createNavController(withController: videosVC, andTitle: "Videos")
        
        let tempVC = TempController()
        let tempNavVC = createNavController(withController: tempVC, andTitle: "Temp")
        
        viewControllers = [videosNavVC, tempNavVC]
    }
    
    private func createNavController(withController controller: UIViewController, andTitle title: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: controller)
        controller.navigationItem.title = title
        navController.tabBarItem.title = title
        
        return navController
    }
}

