//
//  ListReviewEntity.swift
//  MoViews
//
//  Created by Faza Azizi on 24/09/22.
//

import Foundation
import SwiftyJSON

struct ReviewModel{
    var author: String?
    var author_details: ReviewDetailModel = ReviewDetailModel()
    var content: String?
    var created_at: String?
    var id: String?
    var updated_at: String?
    var url: String?
    
    init(){}
    
    init(_ json: JSON){
        author = json["author"].string
        content = json["content"].stringValue
        id = json["id"].stringValue
        created_at = json["created_at"].stringValue
        updated_at = json["updated_at"].stringValue
        url = json["url"].stringValue
        author_details = ReviewDetailModel(json["author_details"])
    }
}

struct ReviewDetailModel{
    var name: String?
    var username: String?
    var avatar_path: String?
    var rating: String?
    
    init(){}
    
    init(_ json: JSON){
        name = json["name"].stringValue
        username = json["username"].stringValue
        avatar_path = json["avatar_path"].stringValue
        rating = json["rating"].stringValue
    }
}
