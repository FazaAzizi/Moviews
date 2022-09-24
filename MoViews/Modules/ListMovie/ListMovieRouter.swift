//
//  ListMovieRouter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class ListMovieRouter: PTRListMovieProtocol{

    
    static func createModuleListMovie() -> ListMovieVC {
        let view = ListMovieVC()
        let presenter = ListMoviePresenter()
        let interactor: PTIListMovieProtocol = ListMovieInteractor()
        let router:PTRListMovieProtocol = ListMovieRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushToDetailPage(id: Int, nav: UINavigationController) {
        let vc = DetailMovieRouter.createModuleDetailMovie()
        vc.id = id
        nav.pushViewController(vc, animated: true)
    }
    
}
