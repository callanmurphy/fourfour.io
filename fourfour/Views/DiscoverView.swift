//
//  SwiftUIView.swift
//  fourfour
//
//  Created by callan on 2021-06-05.
//

import SwiftUI

struct DiscoverView: View {
    @State private var query: String = ""
    @State private var isEditing = false
    @State private var searching = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search", text: $query)
                    { isEditing in
                        self.isEditing = isEditing
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(.label), lineWidth: 1))
                    
                    Button("Search") {
                        searching.toggle()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .foregroundColor(Color(.label))
                    if searching {
                        Text(getSong())
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 5)
                
                Spacer()
                if !query.isEmpty {
                    Text("Searching for: \(query)...")
                }
                Spacer()
            }
            .navigationTitle("Discover")
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
    }
}
