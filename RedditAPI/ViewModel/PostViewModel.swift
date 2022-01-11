//
//  PostViewModel.swift
//  RedditAPI
//
//  Created by Vic Sukiasyan on 7/1/21.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    
    func getPosts() {
        isLoading = true
        
        NetworkManager.shared.getTopListings { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let posts):
                    self.posts = posts
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
