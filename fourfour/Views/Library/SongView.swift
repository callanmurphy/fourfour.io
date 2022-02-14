//
//  SongView.swift
//  fourfour
//
//  Created by callan on 2022-02-13.
//

import SwiftUI

struct SongView: View {
    @State var lyrics: String = ""
//    @FocusState private var isFocused: Bool
    var song: Song
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                TextEditor(text: $lyrics)
                .disableAutocorrection(true)
                .padding()
//                .background(Color.gray)
                .font(.custom("HelveticaNeue", size: 16))
                .lineSpacing(5)
//                .focused($isFocused)
                Spacer()
            }
//            .navigationBarHidden(true)
        }
        .navigationTitle(song.title)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    LocalStorage.myValue = self.lyrics
                }) {
                    Text("Done")
                }
            }
        }
        .onAppear(perform: {
            self.lyrics = LocalStorage.myValue
        })
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(song: Song(title: "Wake Me Up", artist: "Avicii"))
    }
}
