//
//  MainTabbarRouter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class MainTabbarRouter {
    
    var heightTabbar : CGFloat = 0.0
    var selecTabByindex = 0
    
    init(){}
    init( indexSelected: Int){
        selecTabByindex = indexSelected
    }
    
    func showView() -> MainTabbarView {
        let storyboardId = String(describing: MainTabbarView.self)
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: storyboardId) as? MainTabbarView else {
            fatalError("Error loading Storyboard")
        }
        heightTabbar = view.tabBar.frame.height
        view.selectTab = selecTabByindex
        return view
    }
    
    
    func navigateToHome() -> UIViewController {
        let vc = HomeRouter.createModuleHome()
        let homeVC = UINavigationController(rootViewController: vc)
        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage:UIImage(systemName: "house")
        )
        return homeVC
    }
    
    func navigateToProfile() -> UIViewController {
        let profileVC = SearchPageRouter.createModuleSearchPage()
        profileVC.tabBarItem = UITabBarItem(
            title: "Genre",
            image: UIImage(systemName: "list.and.film"),
            selectedImage: UIImage(systemName: "list.and.film")
        )
        return profileVC
    }
    
    func tabbarController(heightBottomBar: CGFloat) -> [UIViewController] {
        return [
            navigateToHome(),
            navigateToProfile()
        ]
    }
    
}
