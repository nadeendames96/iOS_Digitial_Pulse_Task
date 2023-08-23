//  PostsViewModel.swift
//  PostDigitalPulse
//  Created by Nadeen Dames on 22/08/2023.
//

import Foundation
import KRProgressHUD
class PostViewModel {
    private let apiService = APIService()
    var posts: PostsModel = []
    private var allPosts: PostsModel = []
    var comments: CommentsModel = []
       private var batchSize = 20
       private var currentPage = 0
        var users: UsersModel = []
    private var isLoadingData = false
       private var hasMoreData = true
    func fetchPosts(completion: @escaping () -> Void) {
        guard !isLoadingData && hasMoreData else {
                    return
                }
        isLoadingData = true
        KRProgressHUD.show()
          apiService.fetchPosts { [weak self] result in
              self?.isLoadingData = false
              switch result {
              case .success(let posts):
                  DispatchQueue.main.async {
                          self?.allPosts = posts
                      self?.loadNextBatch()
                      completion()
                  }
              case .failure(let error):
                  print("Error fetching posts: \(error)")
              }
          }
      }
    
    func resetPagination() {
           currentPage = 0
           posts.removeAll()
       }
    
    func loadNextBatch() {
        KRProgressHUD.dismiss()
            let startIndex = currentPage * batchSize
            let endIndex = min(startIndex + batchSize, allPosts.count)
        guard startIndex < endIndex else {
              return
          }
        let newPosts = Array(allPosts[startIndex..<endIndex])
        posts.append(contentsOf: newPosts)
            currentPage += 1
        }
 
    
    func fetchAllUsers(completion: @escaping () -> Void) {
          apiService.getAllUsers{ [weak self] result in
              switch result {
              case .success(let users):
                  DispatchQueue.main.async {
                      self?.users = users
                      print("AllUsers: \(users)")
                      completion()
                  }
              case .failure(let error):
                  print("Error fetching posts: \(error)")
              }
          }
      }
    
    func fetchCommentsPost(completion: @escaping () -> Void) {
          apiService.fetchPostComments{ [weak self] result in
              switch result {
              case .success(let comments):
                  DispatchQueue.main.async {
                      self?.comments = comments
                      print("AlComments: \(comments)")
                      completion()
                  }
              case .failure(let error):
                  print("Error fetching posts: \(error)")
              }
          }
      }
    
    func numberOfPosts() -> Int {
        return posts.count
    }
    
    func numberOfCommentsPost() -> Int {
        return comments.count
    }

    func post(at index: Int) -> PostsModelElement {
        return posts[index]
    }
    
    func comment(at index: Int) -> CommentsModelElement {
        return comments[index]
    }
    
    func user(at index: Int) -> UsersModelElement {
        return users[index]
    }
}
