//
//  SearchPageEntity.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import SwiftyJSON

struct GenreModel{
    var name: String?
    var id: Int?
    
    init(){}
    
    init(_ json: JSON){
        name = json["name"].stringValue
        id = json["id"].intValue
    }
    
}
