//
//  SplashScreenPresenter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class SplashScreenPresenter: VTPSplashScreenProtocol{
    var view: PTVSplashScreenProtocol?
    
    var interactor: PTISplashScreenProtocol?
    
    var router: PTRSplashScreenProtocol?
    
    func gotoHome(nav: UINavigationController) {
        router?.pushToHome(nav: nav)
    }
    
    
}

extension SplashScreenPresenter: ITPSplashScreenProtocol{
    
}
