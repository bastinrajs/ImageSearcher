//
//  LoadingView.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import SwiftUI

// View to show while making image search request 
struct LoadingView: View {
    var body: some View {
        Text(LocalizedStringKey(MessageString.loadingMsg))
        Spacer()
    }
}
