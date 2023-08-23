//
//  GeneralApi.swift
//  SHOFNE APP
//
//  Created by Nadeen Dames on 25/07/2023.
//

import Foundation

class NetworkingManager {
    static let shared = NetworkingManager() 
    private init() {
        // Private initializer to prevent external instantiation
    }
    func getRequest<T: Decodable>(
            endpoint: Endpoint,
            completion: @escaping (Result<T, Error>) -> Void
        ) {
            guard let url = endpoint.url else {
                completion(.failure(NetworkError.invalidURL))
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(NetworkError.noData))
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    
    func postRequest<T: Decodable>(
            _ endpoint: Endpoint,
            token: String,
            body: Data?,
            completion: @escaping (Result<T, Error>) -> Void
        ) {
            guard let url = endpoint.url else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpBody = body
            
            URLSession.shared.dataTask(with: request) { data, response, error in
            }.resume()
        }
}
