//
//  DetailMovieRouter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class DetailMovieRouter: PTRDetailMovieProtocol{
    func pushToListReviewPage(id: Int, nav: UINavigationController) {
        let vc = ListReviewRouter.createModuleListReview()
        vc.id = id
        nav.pushViewController(vc, animated: true)
    }
    
    static func createModuleDetailMovie() -> DetailMovieVC {
        let view = DetailMovieVC()
        let presenter = DetailMoviePresenter()
        let interactor: PTIDetailMovieProtocol = DetailMovieInteractor()
        let router:PTRDetailMovieProtocol = DetailMovieRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    
}
