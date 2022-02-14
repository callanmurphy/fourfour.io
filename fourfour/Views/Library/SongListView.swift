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
    @State private var newFolderName: String = ""
    @State private var isEditing = false
    @State private var isCreatingFolder = false
    @State private var searching = false
    @State private var isShowingSheet = false
    var folder: Folder
    var body: some View {
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
                ForEach (songs) { song in
                    NavigationLink(destination: SongView(song: song)){
                            Image(systemName: "music.note")
                        SongRow(song: song)
                    }
                }
            }
            .textCase(nil)
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(folder.title)
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
    func didDismiss(){
//        djwojdoweowe
    }
}

class Song: Identifiable {
    var title: String
    var artist: String

    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}

struct SongRow: View {
    var song: Song
    var body: some View {
        VStack {
//            Image(systemName: "music.note")
            Text(song.title)
            Text(song.artist)
        }
        .padding()
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(folder: Folder(title: "test", songs: [Song(title: "Fair", artist: "Cal Murphy"),
               Song(title: "Nobody Needs to Know", artist: "Jason Robert Brown"),
               Song(title: "Wake Me Up", artist: "Avicii"),
               Song(title: "My Shot", artist: "Lin-Manuel Miranda")]))
            .preferredColorScheme(.dark)
    }
}
