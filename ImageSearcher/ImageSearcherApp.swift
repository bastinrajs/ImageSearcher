//
//  ImageSearcherApp.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import SwiftUI

@main
struct ImageSearcherApp: App {
    var body: some Scene {
        WindowGroup {
            let listViewModel = ImageListViewModel()
            ImageListView(listViewModel: listViewModel)
        }
    }
}
