//
//  SearchPagePresenter.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class SearchPagePresenter: VTPSearchPageProtocol{
    var view: PTVSearchPageProtocol?
    
    var interactor: PTISearchPageProtocol?
    
    var router: PTRSearchPageProtocol?
    
    func startFetchGenres() {
        interactor?.fetchGenres()
    }
    
    func goToListMovie(id: Int, nav: UINavigationController, header: String) {
        router?.pushToListMovie(id: id, nav: nav, header: header)
    }
    
}

extension SearchPagePresenter: ITPSearchPageProtocol{
    func onSuccessFetchGenres(data: [GenreModel]) {
        view?.showFetchGenres(data: data)
    }
    
    func onFailed(message: String) {
        view?.showFailed(message: message)
    }
    
    
}
