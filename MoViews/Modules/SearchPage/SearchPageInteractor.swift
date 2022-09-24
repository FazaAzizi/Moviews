//
//  SearchPageInteractor.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class SearchPageInteractor: PTISearchPageProtocol{
    var presenter: ITPSearchPageProtocol?
    
    func fetchGenres(){
        let url = Endpoint.genres.url()
        let headers :  HTTPHeaders = [
            "content-type": "application/json",
            "api_key": "cc74a1b119c25e983fa8185e818cc52c"
        ]
        var params = Dictionary<String,String>()
        params.updateValue("cc74a1b119c25e983fa8185e818cc52c", forKey: "api_key")
        params.updateValue("en-US", forKey: "language")
        
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).response { response in
            print("api response", response)
            print("api response data", JSON(response.data as Any))
            
            switch response.result {
            case .success:
                print("success")
                if let value = response.data{
                    let json = JSON(value)
                    
                    var dataGenre: [GenreModel] = [GenreModel]()
                    for data in json["genres"].arrayValue{
                        dataGenre.append(GenreModel(data))
                    }
                    self.presenter?.onSuccessFetchGenres(data: dataGenre)
                }
            case .failure(let error):
                print("failure(error)",error)
                self.presenter?.onFailed(message: error.localizedDescription)
            }
        }
    }
}
