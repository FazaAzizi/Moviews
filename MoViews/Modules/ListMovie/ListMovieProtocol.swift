//
//  ListMovieProtocol.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

protocol PTVListMovieProtocol: AnyObject{
    func showFetchMovieById(data: [ListMovieModel], totalPage: Int)
    func showFailed(message: String)
}

protocol VTPListMovieProtocol: AnyObject{
    var view: PTVListMovieProtocol? {get set}
    var interactor: PTIListMovieProtocol? {get set}
    var router: PTRListMovieProtocol? {get set}
    
    func startFetchMoviewById(id: Int, page: Int)
    func gotoDetailPage(id: Int, nav: UINavigationController)

}

protocol PTIListMovieProtocol: AnyObject{
    var presenter:ITPListMovieProtocol? {get set}
    
    func fetchMovieById(id: Int, page: Int)
}

protocol ITPListMovieProtocol: AnyObject{
    func onSuccesFetchMovieById(data: [ListMovieModel], totalPage: Int)
    func onFailed(message: String)
}

protocol PTRListMovieProtocol: AnyObject{
    static func createModuleListMovie()-> ListMovieVC
    func pushToDetailPage(id: Int, nav: UINavigationController)

}
