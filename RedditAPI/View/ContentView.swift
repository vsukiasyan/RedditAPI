//
//  ContentView.swift
//  RedditAPI
//
//  Created by Vic Sukiasyan on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var postViewModel = PostViewModel()
    
    @State private var alertItem: AlertItem?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(postViewModel.posts, id: \.id) { post in
                    NavigationLink(destination: CommentsWebView(url: "http://www.reddit.com\(post.permalink)")) {
                        PostRow(post: post)
                    }
                }
                .navigationTitle("Reddit Top Listings")
            }
            .onAppear { postViewModel.getPosts() }
            
            if postViewModel.isLoading { LoadingView() }
        }
        .alert(item: $alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
