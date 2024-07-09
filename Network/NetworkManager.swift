//
//  NetworkManager.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import Foundation

// Network error types
enum NetworkError: Error {
    case badUrl
    case decodingError
    case serverError
}


class NetworkManager {
    static let shared = NetworkManager()
    var urlSession: URLSession = .shared
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    // private init
    private init() {}
    
    private func buildRequest(tagName: String) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Constants.HOST_BASE_URL
        components.path = Constants.IMAGE_SEARCH_ENDPOINT
        components.queryItems = [
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1"),
            URLQueryItem(name: "tags", value: tagName)
        ]
        guard let url = components.url else { return nil }
        // Default GET method
        return URLRequest(url: url)
    }
    
}

extension NetworkManager: ImageSearchService {
    func fetchImageByTag(name: String) async throws -> ImageListModel {
        guard let urlRequest = buildRequest(tagName: name) else { throw NetworkError.badUrl }
        do {
            let (data, response) = try await urlSession.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NetworkError.serverError }
            let responseModel = try JSONDecoder().decode(ImageListModel.self, from: data)
            return responseModel
        }
        catch {
            throw NetworkError.decodingError
        }
    }
}
