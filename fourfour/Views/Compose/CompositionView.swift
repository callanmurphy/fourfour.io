//
//  CompositionView.swift
//  fourfour
//
//  Created by callan on 2021-06-05.
//

import SwiftUI

struct CompositionView: View {
    @State var input: String = ""
    
    var body: some View {
        NavigationView {
            VStack() {
                Spacer()
            }
            .navigationTitle("Compose")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Delete tapped!")
                    }) {
                        HStack {
                            Image(systemName: "square.and.pencil")
                                .frame(width: 20.0, height: 20.0)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(40)
                    }
                    .padding(.top)
                }
            }
        }
    }
}

struct CompositionView_Previews: PreviewProvider {
    static var previews: some View {
        CompositionView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
    }
}
