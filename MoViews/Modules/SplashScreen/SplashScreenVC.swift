//
//  SplashScreenVC.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import UIKit

class SplashScreenVC: UIViewController {
    
    var presenter: VTPSplashScreenProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if let navigation = self.navigationController {
                navigation.pushViewController(MainTabbarRouter().showView(), animated: true)
            }
        }
    }

}

extension SplashScreenVC: PTVSplashScreenProtocol{
    
}
