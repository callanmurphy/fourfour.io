//
//  LibraryView.swift
//  fourfour
//
//  Created by callan on 2021-06-05.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Play")
            }
            .navigationTitle("Play")
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
