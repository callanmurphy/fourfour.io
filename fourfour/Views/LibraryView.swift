//
//  LibraryView.swift
//  fourfour
//
//  Created by callan on 2021-06-05.
//

import SwiftUI

struct LibraryView: View {
    @State private var query: String = ""
    @State private var lyricInput: String = ""
    @State private var isEditing = false
    @State private var searching = false
    @State private var isShowingSheet = false
    var folders = ["General", "Musicals", "My Songs", "Project Germany"]
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
                    Text("Folders")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.label))) {
                    ForEach (folders, id: \.self) { folderName in
                        FolderRow(name: folderName)
                    }
                }
                .textCase(nil)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Library")
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

struct FolderRow: View {
    var name: String
    var body: some View {
        HStack {
            Image(systemName: "folder")
            Text(name)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
