//
//  ListMoviePresenter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class ListMoviePresenter: VTPListMovieProtocol{
    func gotoDetailPage(id: Int, nav: UINavigationController) {
        router?.pushToDetailPage(id: id, nav: nav)
    }
    
    var view: PTVListMovieProtocol?
    
    var interactor: PTIListMovieProtocol?
    
    var router: PTRListMovieProtocol?
    
    func startFetchMoviewById(id: Int, page: Int) {
        interactor?.fetchMovieById(id: id, page: page)
    }
    
}

extension ListMoviePresenter: ITPListMovieProtocol{
    func onSuccesFetchMovieById(data: [ListMovieModel], totalPage: Int) {
        view?.showFetchMovieById(data: data, totalPage: totalPage)
    }
    
    func onFailed(message: String) {
        view?.showFailed(message: message)
    }
    
    
}
