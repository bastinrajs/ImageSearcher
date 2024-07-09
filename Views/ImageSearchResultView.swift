//
//  ImageSearchResultView.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import SwiftUI

// Success view post image API returned response
struct ImageSearchResultView: View {
    var imageList: [ImageItemModel] 
    var body: some View {
        List(imageList, id: \.title) { imageModel in
            NavigationLink(destination: ImageDetailsView(imageItem: imageModel)) {
                HStack(alignment: .top) {
                    ImagePosterView(urlStr: imageModel.imageUrl)
                        .frame(width: 250, height: 200)
                        .cornerRadius(5.0)
                    }
                }
        }
    }
}
