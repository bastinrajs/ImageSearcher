//
//  ImageListModel.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import Foundation

struct ImageListModel: Decodable {
    var title: String
    var items: [ImageItemModel]
}

struct ImageItemModel: Decodable {
    var imageUrl:String {
        media.m
    }
    
    var title: String
    var description: String
    var published: String
    var author: String
    var media: ImageItemMediaModel
}

struct ImageItemMediaModel: Decodable {
    var m: String
}
