//
//  DetailMoviePresenter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class DetailMoviePresenter: VTPDetailMovieProtocol{
    func gotoListReviewPage(id: Int, nav: UINavigationController) {
        router?.pushToListReviewPage(id: id, nav: nav)
    }
    
    func startFetchDetailMovie(id: Int, nav: UINavigationController) {
        interactor?.fetchDetailMovie(id: id, nav: nav )
    }
    
    var view: PTVDetailMovieProtocol?
    
    var interactor: PTIDetailMovieProtocol?
    
    var router: PTRDetailMovieProtocol?
    
    
}

extension DetailMoviePresenter: ITPDetailMovieProtocol{
    func onSuccessFetchDetailMovie(data: DetailMovieModel, nav: UINavigationController) {
        view?.showDetailMovie(data: data, nav: nav)
    }
    
    func onFailedFetchDetailMovie(message: String) {
        view?.showError(message: message)
    }
    
    
}
