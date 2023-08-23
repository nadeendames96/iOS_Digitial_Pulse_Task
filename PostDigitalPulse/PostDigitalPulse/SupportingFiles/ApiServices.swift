//
//  ApiServices.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 22/08/2023.
//

import Foundation
class APIService {
    static let shared = APIService()
    func fetchPosts(completion: @escaping (Result<[PostsModelElement], Error>) -> Void) {
        NetworkingManager.shared.getRequest(endpoint: .posts) { (result: Result<[PostsModelElement], Error>) in
            switch result {
            case .success(let posts):
                print("GET Response Successful:")
                completion(.success(posts))
//               print(posts)
            case .failure(let error):
                print("GET Response Failed:")
                print("Error: \(error)")
            }
            
        }
    }
    
    func getAllUsers(completion: @escaping (Result<[UsersModelElement], Error>) -> Void) {
        NetworkingManager.shared.getRequest(endpoint: .users) { (result: Result<[UsersModelElement], Error>) in
            switch result {
            case .success(let users):
                print("GET Response Users Successful:")
               print(users)
                completion(.success(users))
            case .failure(let error):
                print("GET Response Failed:")
                print("Error: \(error)")
            }
            
        }
    }
    
    func fetchPostComments(completion: @escaping (Result<[CommentsModelElement], Error>) -> Void) {
        NetworkingManager.shared.getRequest(endpoint: .comments) { (result: Result<[CommentsModelElement], Error>) in
            switch result {
            case .success(let comments):
                print("GET Response comments Successful:")
               print(comments)
                completion(.success(comments))
            case .failure(let error):
                print("GET Response Failed:")
                print("Error: \(error)")
            }
            
        }
    }
}
