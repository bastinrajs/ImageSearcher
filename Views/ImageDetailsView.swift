//
//  ImageDetailsView.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import SwiftUI

struct ImageDetailsView: View {
    var imageItem: ImageItemModel
    let image = UIImage(named: "placeholder")
    var body: some View {
        ImagePosterView(urlStr: imageItem.imageUrl)
            .padding()
        Text(imageItem.title).font(.headline)
        if let descriptionText = imageItem.description.convertHtmlToAtttibutedString() {
            Text((AttributedString(descriptionText)))
        }
        Text("Author: \(imageItem.author)").font(.subheadline)
        
        // Get image width and height from XMLParser. This is failing. //TO-DO Need more work.
        // let (width, height) = Parser.instance.getImageDimension(htmlString: imageItem.description)
        // Text("Image width & height: \(width) & \(height)")
        
        if let formattedPublishedDate = imageItem.published.formattedVersion() {
            Text("Published Date: \(formattedPublishedDate)").font(.subheadline)
        }
        Spacer()
        ShareLink(item: URL(string: imageItem.imageUrl)!) {
            Label(LocalizedStringKey(MessageString.sharePictMsg), systemImage: "square.and.arrow.up")
        }
        .padding()
    }
}
