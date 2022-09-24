//
//  ListReviewPresenter.swift
//  MoViews
//
//  Created by Faza Azizi on 24/09/22.
//

import Foundation
import UIKit

class ListReviewPresenter: VTPListReviewProtocol{
    var view: PTVListReviewProtocol?
    
    var interactor: PTIListReviewProtocol?
    
    var router: PTRListReviewProtocol?
    
    func startFetchReviewById(id: Int, page: Int) {
        interactor?.fetchReviewById(id: id, page: page)
    }
    
    
}

extension ListReviewPresenter: ITPListReviewProtocol{
    func onSuccesFetchReviewById(data: [ReviewModel], totalPage: Int) {
        view?.showFetchReviewById(data: data, totalPage: totalPage)
    }
    
    func onFailed(message: String) {
        view?.showFailed(message: message)
    }
    
    
}
