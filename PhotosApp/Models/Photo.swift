//
//  Photo.swift
//  PhotosApp
//
//  Created by Gabriel on 2/23/21.
//

import Foundation

struct Photo: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
