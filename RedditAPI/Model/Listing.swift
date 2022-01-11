//
//  Listing.swift
//  RedditAPI
//
//  Created by Vic Sukiasyan on 7/1/21.
//

import Foundation

struct Listing {
    var posts = [Post]()
}

extension Listing: Decodable {
    enum CodingKeys: String, CodingKey {
        case posts = "children"
        
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        posts = try data.decode([Post].self, forKey: .posts)
    }
}
