//
//  ImageListViewModel.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import Foundation
import Combine

// Loading states
enum LoadingState {
    case loading
    case success
    case failed
    case none
}

// Protocol defines image fetch method based on user search criteria
protocol ImageSearchService {
    func fetchImageByTag(name: String) async throws -> ImageListModel
}

class ImageListViewModel: ObservableObject {
    @Published var images = [ImageItemModel]()
    @Published var loadingState: LoadingState = .none
    var imageSearchService: ImageSearchService = NetworkManager.shared

    // This function makes network call and fetches image content from Flickr
    @discardableResult
    func getImages(tagName: String) -> Task<Void, Error> {
        Task {
            do {
                let imageListModel = try await imageSearchService.fetchImageByTag(name: tagName)
                DispatchQueue.main.async { [self] in
                    loadingState = .success
                    self.images = imageListModel.items
                }
            }
            catch {
                loadingState = .failed
                // Log/Capture error here
            }
        }
    }
}
