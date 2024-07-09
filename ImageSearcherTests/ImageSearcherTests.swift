//
//  ImageSearcherTests.swift
//  ImageSearcherTests
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import XCTest
@testable import ImageSearcher

final class ImageSearcherTests: XCTestCase {

    func testFetchImageServerCall() async throws {
        let listViewModel = ImageListViewModel()
        listViewModel.imageSearchService = MockImageSearchService()
        let task = listViewModel.getImages(tagName: "forest")
        let result = await task.result
        XCTAssertNotNil(result)
    }
    
    func testImageLoaderDownloadData() {
        let imageLoader = ImageLoader()
        imageLoader.downloadImage(urlString: "https://live.staticflickr.com/65535/53843329121_ce02a5d55e_m.jpg")
    }
}

class MockImageSearchService: ImageSearchService {
    func fetchImageByTag(name: String) async throws -> ImageSearcher.ImageListModel {
        guard let path = Bundle.main.path(forResource: "image_search_response", ofType: "json") else { throw NetworkError.badUrl }
        let jsonData = try Data(contentsOf: URL(filePath: path))
        let responseModel = try JSONDecoder().decode(ImageListModel.self, from: jsonData)
        return responseModel
    }
}
