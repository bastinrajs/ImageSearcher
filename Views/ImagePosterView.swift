//
//  ImagePosterView.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import SwiftUI

struct ImagePosterView: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(urlStr: String) {
        imageLoader.downloadImage(urlString: urlStr)
    }
    
    var body: some View {
        if let imageData = imageLoader.imageData, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage).resizable()
        }
        else {
            return Image("placeholder")
        }
    }
}
