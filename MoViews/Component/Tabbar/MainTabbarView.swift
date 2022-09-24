//
//  MainTabbarView.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class MainTabbarView: UITabBarController{
    var selectTab = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func setup() {
        let vc = MainTabbarRouter()
        self.viewControllers = vc.tabbarController(heightBottomBar: self.tabBar.frame.height)
        self.selectedIndex = selectTab
        self.delegate = self
    }
}

extension MainTabbarView: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 2 {
            return false
        }
        return true
    }
    
}
