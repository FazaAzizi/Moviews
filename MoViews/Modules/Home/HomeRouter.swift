//
//  HomeRouter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class HomeRouter: PTRHomeProtocol{
    static func createModuleHome() -> HomeVC {
        let view = HomeVC()
        let presenter = HomePresenter()
        let interactor: PTIHomeProtocol = HomeInteractor()
        let router:PTRHomeProtocol = HomeRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    
}
