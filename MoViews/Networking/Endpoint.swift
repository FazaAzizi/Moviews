//
//  Endpoint.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

let BASE_URL = "https://api.themoviedb.org/3"
let API_KEY = "cc74a1b119c25e983fa8185e818cc52c"

enum Endpoint : String{
    case toprated = "/movie/top_rated"
    case upcoming = "/movie/upcoming"
    case popular = "/movie/popular"
    case nowplaying = "/movie/now_playing"
    case latest = "/movie/latest"
    case genres = "/genre/movie/list"
    case movieById = "/discover/movie"
    
    func url() -> String {
        return "\(BASE_URL)\(self.rawValue)"
    }
}


class ApiRequest{
    static let shared = ApiRequest()
    
    
    func request(_ endpoint: String, method: HTTPMethod, parameters: Parameters? = nil, encoding: JSONEncoding? = .default, headers: HTTPHeaders?, nav: UINavigationController, isHiddenLoader : Bool = false, completion: @escaping (_ responseJson: AFDataResponse<Any>) -> Void) {
        print("api endpoint request", endpoint)
        print("api header request", headers as Any)
        print("api param request", parameters as Any)
        
        
        
        
        AuthSessionManager.current.session.request(endpoint, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers, requestModifier: { $0.timeoutInterval = TimeInterval(180) }).validate().responseJSON { response in
            print("api response", response)
            print("api response data", JSON(response.data as Any))
            print("api status code", response.response?.statusCode as Any)

            if (response.response?.statusCode == 401) {
            } else if (response.response?.statusCode == 403) {
                print("got invalid token, must refresh")
            } else if (response.response?.statusCode == 503 || response.response?.statusCode == 504) {
            }else {
                if let headerResponse = response.response?.allHeaderFields {
                    if (headerResponse["Content-Type"] as? String)?.split(separator: ";")[0] == "text/html" {
                    }
                }
                completion(response)
            }
        }
    }
}


class AuthSessionManager {
    static let current = AuthSessionManager()
    let session = Session(interceptor: AuthInterceptor(), serverTrustManager: ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: ["": DisabledTrustEvaluator()]))
}

class AuthInterceptor: RequestInterceptor {
    
    // MARK: - Properties
    var validToken: String?
    var isRefreshing: Bool = false
    var retryLimit = 3

    // MARK: - Conforming methods
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {

        let request = urlRequest

        completion(.success(request))
        
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
        guard request.retryCount < retryLimit else {
            completion(.doNotRetry)
            return
        }
        print("\nretried; retry count: \(request.retryCount)\n")
        guard let statusCode = request.response?.statusCode else {
            completion(.doNotRetry)
            return
        }
        
        switch statusCode {
        case 200...299:
            completion(.doNotRetry)
        case 401:
            completion(.doNotRetry)
        case 403:
            completion(.doNotRetry)
        default:
            completion(.doNotRetry)
        }
    }

}
