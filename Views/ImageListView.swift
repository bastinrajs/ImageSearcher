//
//  ImageListView.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import SwiftUI

struct ImageListView: View {
    @ObservedObject var listViewModel: ImageListViewModel
    @State private var searchText = ""
    var body: some View {
         VStack {
             TextField(LocalizedStringKey(MessageString.searchText), text: $searchText).onChange(of: searchText, { _, newValue in
                 searchTextValueDidChange(value: newValue)
             }).textFieldStyle(.roundedBorder)
             Spacer()
                 .navigationTitle(LocalizedStringKey(MessageString.navigationTitle))
             
             if listViewModel.loadingState == .success {
                 ImageSearchResultView(imageList: listViewModel.images)
             }
             else if listViewModel.loadingState == .failed {
                 FailView()
             }
             else if listViewModel.loadingState == .loading {
                 LoadingView()
             }
             
         }.padding()
            .addNavigationView()
    }
}

extension ImageListView {
    func searchTextValueDidChange(value: String) {
        listViewModel.loadingState = .loading
        listViewModel.getImages(tagName: value)
    }
}


struct ImageListViewCell: View {
    let image: Image
    var body: some View {
        VStack {
            image
        }
    }
}
