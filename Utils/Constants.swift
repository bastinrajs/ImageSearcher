//
//  Constants.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import Foundation

struct Constants {
    static let HOST_BASE_URL = "api.flickr.com"
    static let IMAGE_SEARCH_ENDPOINT = "/services/feeds/photos_public.gne"
}

// This must be in localization string file. For now I'm refering from constants to avoid hardcoding string
struct MessageString {
    static let loadingFailureMsg = "Sorry, Image search failed. Please try again..!"
    static let searchText = "Search images here, use comma separator to search more "
    static let loadingMsg = "Images are loading..."
    static let sharePictMsg = "Share this picture"
    static let publishedDate = "Published Date:"
    static let navigationTitle = "Search Image"
}
