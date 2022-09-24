//
//  ListMovieEntity.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import SwiftyJSON

struct ListMovieModel{
    var adult: Bool?
    var backdropPath: String?
    var posterPath: String?
    var genreId: [Int] = []
    var id: Int?
    var title: String?
    var overview: String?
    
    init(){}
    
    init(_ json: JSON){
        adult = json["adult"].boolValue
        backdropPath = json["backdrop_path"].stringValue
        id = json["id"].intValue
        title = json["title"].stringValue
        overview = json["overview"].stringValue
    }
    
}
