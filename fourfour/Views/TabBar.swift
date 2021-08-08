//
//  ContentView.swift
//  fourfour
//
//  Created by callan on 2021-05-27.
//

import SwiftUI

struct eContentView: View {
    @State var selectedIndex = 0
    @State var query: String = " "
    
    let icons = ["magnifyingglass", "scribble", "music.note"]
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    DiscoverView()
                case 1:
                    CompositionView()
                case 2:
                    LibraryView()
                default:
                    DiscoverView()
                }
            }
            
            Spacer() // push tab bar to button
            
            Divider()
                .padding(.bottom, 10)
            HStack {
                ForEach(0..<3, id: \.self) { number in
                    Spacer() // left space
                    Button(action: {
                        self.selectedIndex = number
                    }, label: {
                        Image(systemName: icons[number])
                            .padding(.bottom, 5)
                            .font(.system(size: 25,
                                          weight: .regular,
                                          design: .default))
                            .foregroundColor(selectedIndex == number ? .accentColor : Color(.label))
                    })
                    Spacer() // right space
                }
            }
        }
    }
    
}



struct eContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
    }
}
