//
//  DetailMovieInteractor.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DetailMovieInteractor: PTIDetailMovieProtocol{
    
    var presenter: ITPDetailMovieProtocol?
    
    func fetchDetailMovie(id: Int, nav: UINavigationController) {
        let headers :  HTTPHeaders = [
            "content-type": "application/json",
            "api_key": "cc74a1b119c25e983fa8185e818cc52c"
        ]
        var params = Dictionary<String,String>()
        params.updateValue("cc74a1b119c25e983fa8185e818cc52c", forKey: "api_key")
        params.updateValue("en-US", forKey: "language")
        
        AF.request("https://api.themoviedb.org/3/movie/\(id)", method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).response { response in
            print("api response", response)
            print("api response data", JSON(response.data as Any))
            
            switch response.result {
            case .success:
                print("success")
                if let value = response.data{
                    let json = JSON(value)
                    
                    let data: DetailMovieModel = DetailMovieModel(json)
                    self.presenter?.onSuccessFetchDetailMovie(data: data, nav: nav)
                }
            case .failure(let error):
                print("failure(error)",error)
                self.presenter?.onFailedFetchDetailMovie(message: error.localizedDescription)
            }
        }
    }
}
