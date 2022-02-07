//
//  FolderView.swift
//  fourfour
//
//  Created by callan on 2021-06-05.
//

import SwiftUI

struct SongListView: View {
    @State private var query: String = ""
    @State private var lyricInput: String = ""
    @State private var isEditing = false
    @State private var searching = false
    @State private var isShowingSheet = false
    var songs = ["Fair", "Nobody Needs to Know", "Perfect", "Tonight"]
    var dates = ["03/31/2001", "03/31/2001", "03/31/2001", "03/31/2001"]
    var body: some View {
        NavigationView {
            List {
                TextField("Search", text: $query)
                { isEditing in
                    self.isEditing = isEditing
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                Section(header:
                    Text("Songs")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.label))) {
                    ForEach (songs, id: \.self) { title in
                        SongRow(name: title)
                    }
                }
                .textCase(nil)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Folder")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Text("New")
                    }
                    .sheet(isPresented: $isShowingSheet,
                           onDismiss: didDismiss) {
                        VStack {
                            TextField("Search", text: $lyricInput)
                            Button("Dismiss",
                                   action: { isShowingSheet.toggle() })
                        }
                    }
                }
            }
        }
    }
    
    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct SongRow: View {
    var name: String
    var body: some View {
        VStack {
//            Image(systemName: "music.note")
            Text(name)
            Text("03/12/21")
//            Text(date)
        }
        .padding()
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
            .preferredColorScheme(.dark)
    }
}
