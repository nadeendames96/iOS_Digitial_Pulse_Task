//
//  PostsModel.swift
//  PostDigitalPulse
//
//  Created by Nadeen Dames on 22/08/2023.
//

import Foundation
// MARK: - PoatsModelElement
struct PostsModelElement: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
typealias PostsModel = [PostsModelElement]
