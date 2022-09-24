//
//  SearchPageRouter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class SearchPageRouter: PTRSearchPageProtocol{
    static func createModuleSearchPage() -> SearchPageVC {
        let view = SearchPageVC()
        let presenter = SearchPagePresenter()
        let interactor: PTISearchPageProtocol = SearchPageInteractor()
        let router:PTRSearchPageProtocol = SearchPageRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func pushToListMovie(id: Int, nav: UINavigationController, header: String) {
        let vc = ListMovieRouter.createModuleListMovie()
        vc.id = id
        vc.header = header
        nav.pushViewController(vc, animated: true)
    }
    
    
}
