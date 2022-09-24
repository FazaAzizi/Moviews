//
//  ListReviewProtocol.swift
//  MoViews
//
//  Created by Faza Azizi on 24/09/22.
//

import Foundation
protocol PTVListReviewProtocol: AnyObject{
    func showFetchReviewById(data: [ReviewModel], totalPage: Int)
    func showFailed(message: String)
}

protocol VTPListReviewProtocol: AnyObject{
    var view: PTVListReviewProtocol? {get set}
    var interactor: PTIListReviewProtocol? {get set}
    var router: PTRListReviewProtocol? {get set}
    
    func startFetchReviewById(id: Int, page: Int)

}

protocol PTIListReviewProtocol: AnyObject{
    var presenter:ITPListReviewProtocol? {get set}
    
    func fetchReviewById(id: Int, page: Int)
}

protocol ITPListReviewProtocol: AnyObject{
    func onSuccesFetchReviewById(data: [ReviewModel], totalPage: Int)
    func onFailed(message: String)
}

protocol PTRListReviewProtocol: AnyObject{
    static func createModuleListReview()-> ListReviewVC

}
