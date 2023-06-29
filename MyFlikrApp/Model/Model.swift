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
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    let description: Description
    let datetaken: String
    let datetakengranularity: Int
    let datetakenunknown, ownername: String
    let urlM: String
    let heightM, widthM: Int

    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily, description, datetaken, datetakengranularity, datetakenunknown, ownername
        case urlM = "url_m"
        case heightM = "height_m"
        case widthM = "width_m"
    }
}

// MARK: - Description
struct Description: Codable {
    let content: String

    enum CodingKeys: String, CodingKey {
        case content = "_content"
    }
}
