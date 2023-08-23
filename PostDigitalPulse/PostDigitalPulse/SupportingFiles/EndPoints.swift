//
//  EndPoints.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 22/08/2023.
//

import Foundation
enum Endpoint {
    case posts
    case users
    case comments
    var url: URL? {
        switch self {
            case .posts:
            return URL(string: "\(Api.appBaseUrl)\(ApiToUse.posts.rawValue)")
            
        case .users:
        return URL(string: "\(Api.appBaseUrl)\(ApiToUse.users.rawValue)")
            
        case .comments:
        return URL(string: "\(Api.appBaseUrl)\(ApiToUse.comments.rawValue)")
        }
    }
}
