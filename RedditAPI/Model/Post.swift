//
//  Post.swift
//  RedditAPI
//
//  Created by Vic Sukiasyan on 7/1/21.
//

import Foundation
import SwiftUI

struct Post: Identifiable, Decodable {
    let id: String
    let title: String
    let thumbnail: String
    let permalink: String
}

extension Post {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case thumbnail
        case permalink
        
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        id = try dataContainer.decode(String.self, forKey: .id)
        title = try dataContainer.decode(String.self, forKey: .title)
        thumbnail = try dataContainer.decode(String.self, forKey: .thumbnail)
        permalink = try dataContainer.decode(String.self, forKey: .permalink)
    }
}
