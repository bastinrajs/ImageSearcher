//
//  ImageLoader.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var imageData: Data?
    
    func downloadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    self.imageData = data
                }
            }
        }
        session.resume()
    }
}
