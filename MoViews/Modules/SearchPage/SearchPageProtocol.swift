//
//  SearchPageProtocol.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

protocol PTVSearchPageProtocol: AnyObject{
    func showFetchGenres(data: [GenreModel])
    func showFailed(message: String)
}

protocol VTPSearchPageProtocol: AnyObject{
    var view: PTVSearchPageProtocol? {get set}
    var interactor: PTISearchPageProtocol? {get set}
    var router: PTRSearchPageProtocol? {get set}
    
    func startFetchGenres()
    func goToListMovie(id:Int, nav: UINavigationController, header: String)
}

protocol PTISearchPageProtocol: AnyObject{
    var presenter:ITPSearchPageProtocol? {get set}
    func fetchGenres()
}

protocol ITPSearchPageProtocol: AnyObject{
    func onSuccessFetchGenres(data: [GenreModel])
    func onFailed(message: String)
}

protocol PTRSearchPageProtocol: AnyObject{
    static func createModuleSearchPage()-> SearchPageVC
    func pushToListMovie(id:Int, nav: UINavigationController, header: String)

}
