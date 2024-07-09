//
//  FailView.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import SwiftUI

// View to show when image search result produce error
struct FailView: View {
    var body: some View {
        Text(LocalizedStringKey(MessageString.loadingFailureMsg))
        Spacer()
    }
}
