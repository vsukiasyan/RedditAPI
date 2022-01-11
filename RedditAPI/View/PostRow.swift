//
//  PostRow.swift
//  RedditAPI
//
//  Created by Vic Sukiasyan on 7/1/21.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    
    var body: some View {
        HStack {
            ArticleRemoteImage(urlString: post.thumbnail)
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5) {
                Text(post.title)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .padding(.trailing)
            }
            .padding(.leading)
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        PostRow(post: Post(id: "1234", title: "Test Title Blah blah blah", thumbnail: "http://www.blah.com/image.jpg", permalink: "http://www.google.com"))
    }
}
