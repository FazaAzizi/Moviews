//
//  SplashScreenProtocol.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

protocol VTPSplashScreenProtocol: AnyObject{
    var view: PTVSplashScreenProtocol? {get set}
    var interactor: PTISplashScreenProtocol? {get set}
    var router: PTRSplashScreenProtocol? {get set}
    
    func gotoHome(nav: UINavigationController)
}

protocol PTVSplashScreenProtocol: AnyObject{
    
}

protocol PTISplashScreenProtocol: AnyObject{
    var presenter:ITPSplashScreenProtocol? {get set}
}

protocol ITPSplashScreenProtocol: AnyObject{
    
}

protocol PTRSplashScreenProtocol: AnyObject{
    static func createModuleSplash()-> SplashScreenVC
    func pushToHome(nav: UINavigationController)
}
