//
//  ListReviewRouter.swift
//  MoViews
//
//  Created by Faza Azizi on 24/09/22.
//

import Foundation

class ListReviewRouter: PTRListReviewProtocol{
    static func createModuleListReview() -> ListReviewVC {
        let view = ListReviewVC()
        let presenter = ListReviewPresenter()
        let interactor: PTIListReviewProtocol = ListReviewInteractor()
        let router:PTRListReviewProtocol = ListReviewRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    
}
