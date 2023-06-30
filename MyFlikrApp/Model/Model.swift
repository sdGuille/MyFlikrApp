//
//  Model.swift
//  MyFlikrApp
//
//  Created by Guillermo Ruiz Baires on 28/6/23.
//

import Foundation

import Foundation

// MARK: - Photos
struct Photos: Codable {
    let photos: PhotosClass
    let stat: String
}

// MARK: - PhotosClass
struct PhotosClass: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable, Identifiable {
    let id, owner, secret, server: String

    let title: String

    let description: Description
    let datetaken: String

    let ownername: String
    var urlM: String

    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, title, description, datetaken, ownername
        case urlM = "url_m"
    }
}

// MARK: - Description
struct Description: Codable {
    let content: String

    enum CodingKeys: String, CodingKey {
        case content = "_content"
    }
}
