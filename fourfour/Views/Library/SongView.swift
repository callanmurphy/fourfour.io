//
//  SongView.swift
//  fourfour
//
//  Created by callan on 2022-02-13.
//

import SwiftUI

struct SongView: View {
    var song: Song
    var body: some View {
        ZStack {
            VStack {
                Text(song.title)
                Text(song.artist)
            }
        }
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(song: Song(title: "Wake Me Up", artist: "Avicii"))
    }
}
