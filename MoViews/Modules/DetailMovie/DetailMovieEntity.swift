//
//  DetailMovieEntity.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import SwiftyJSON


struct DetailMovieModel{
    var vote_count: Int?
    var title: String?
    var overview: String?
    var runtime: Int?
    var vote_average: Double?
    var release_date: String?
    var genre: [GenreModel] = []
    var productionCompanie: [DetailMovieProdCompanie] = []
    var adult: Bool?
    var id: Int?
    var poster_path: String?
    var backdrop_path: String?
    
    init(){}
    
    init(_ json: JSON){
        adult = json["adult"].boolValue
        backdrop_path = json["backdrop_path"].stringValue
        poster_path = json["poster_path"].stringValue
        id = json["id"].intValue
        title = json["title"].stringValue
        overview = json["overview"].stringValue
        vote_count = json["vote_count"].intValue
        vote_average = json["runtime"].doubleValue
        runtime = json["runtime"].intValue
        release_date = json["release_date"].stringValue
        
        for i in json["genres"].arrayValue{
            genre.append(GenreModel(i))
        }
        for i in json["production_companies"].arrayValue{
            productionCompanie.append(DetailMovieProdCompanie(i))
        }
    }
}

struct DetailMovieProdCompanie{
    var id: Int?
    var name: String?
    var country: String?
    
    init(){}
    
    init(_ json: JSON){
        id = json["id"].intValue
        name = json["name"].stringValue
        country = json["country"].stringValue
    }
}
