//
//  ListReviewInteractor.swift
//  MoViews
//
//  Created by Faza Azizi on 24/09/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class ListReviewInteractor: PTIListReviewProtocol{
    var presenter: ITPListReviewProtocol?
    
    func fetchReviewById(id: Int, page: Int) {
        let headers :  HTTPHeaders = [
            "content-type": "application/json",
            "api_key": "cc74a1b119c25e983fa8185e818cc52c"
            
        ]
        var params = Dictionary<String,String>()
        params.updateValue("cc74a1b119c25e983fa8185e818cc52c", forKey: "api_key")
        params.updateValue("en-US", forKey: "language")
        params.updateValue("\(page)", forKey: "page")
        
        AF.request("https://api.themoviedb.org/3/movie/\(id)/reviews", method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).response { response in
            print("api response", response)
            print("api response data", JSON(response.data as Any))
            
            switch response.result {
            case .success:
                print("success")
                if let value = response.data{
                    let json = JSON(value)
                    
                    var listReview: [ReviewModel] = [ReviewModel]()
                    let totalPage: Int = json["total_pages"].intValue
                    for data in json["results"].arrayValue{
                        listReview.append(ReviewModel(data))
                    }
                    
                    self.presenter?.onSuccesFetchReviewById(data: listReview, totalPage: totalPage)
                }
            case .failure(let error):
                print("failure(error)",error)
                self.presenter?.onFailed(message: error.localizedDescription)
            }
        }
    }
    
    
}
