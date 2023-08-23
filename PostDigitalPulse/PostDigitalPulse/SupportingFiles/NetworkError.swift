//
//  NetworkError.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 22/08/2023.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
