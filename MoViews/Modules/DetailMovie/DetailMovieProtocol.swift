//
//  DetailMovieProtocol.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

protocol PTVDetailMovieProtocol: AnyObject{
    func showDetailMovie(data: DetailMovieModel, nav: UINavigationController)
    func showError(message: String)
}

protocol VTPDetailMovieProtocol: AnyObject{
    var view: PTVDetailMovieProtocol? {get set}
    var interactor: PTIDetailMovieProtocol? {get set}
    var router: PTRDetailMovieProtocol? {get set}
    
    func startFetchDetailMovie(id: Int, nav: UINavigationController)
    func gotoListReviewPage(id:Int, nav: UINavigationController)
}

protocol PTIDetailMovieProtocol: AnyObject{
    var presenter:ITPDetailMovieProtocol? {get set}
    func fetchDetailMovie(id: Int, nav: UINavigationController)
}

protocol ITPDetailMovieProtocol: AnyObject{
    func onSuccessFetchDetailMovie(data: DetailMovieModel, nav: UINavigationController)
    func onFailedFetchDetailMovie(message: String)
}

protocol PTRDetailMovieProtocol: AnyObject{
    static func createModuleDetailMovie()-> DetailMovieVC
    func pushToListReviewPage(id:Int, nav: UINavigationController)
}
