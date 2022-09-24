//
//  ListMovieInteractor.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class ListMovieInteractor: PTIListMovieProtocol{
    var presenter: ITPListMovieProtocol?
    
    func fetchMovieById(id: Int, page: Int) {
        let headers :  HTTPHeaders = [
            "content-type": "application/json",
            "api_key": "cc74a1b119c25e983fa8185e818cc52c"
            
        ]
        var params = Dictionary<String,String>()
        params.updateValue("cc74a1b119c25e983fa8185e818cc52c", forKey: "api_key")
        params.updateValue("en-US", forKey: "language")
        params.updateValue("\(id)", forKey: "with_genres")
        params.updateValue("\(page)", forKey: "page")
        
        AF.request("https://api.themoviedb.org/3/discover/movie", method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).response { response in
            print("api response", response)
            print("api response data", JSON(response.data as Any))
            
            switch response.result {
            case .success:
                print("success")
                if let value = response.data{
                    let json = JSON(value)
                    
                    var listMoview: [ListMovieModel] = [ListMovieModel]()
                    for data in json["results"].arrayValue{
                        listMoview.append(ListMovieModel(data))
                    }
                    let total: Int = json["total_pages"].intValue
                    self.presenter?.onSuccesFetchMovieById(data: listMoview, totalPage: total)
                }
            case .failure(let error):
                print("failure(error)",error)
                self.presenter?.onFailed(message: error.localizedDescription)
            }
        }
    }
}
