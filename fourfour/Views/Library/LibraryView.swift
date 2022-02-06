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
    @State private var newFolderName: String = ""
    @State private var isEditing = false
    @State private var isCreatingFolder = false
    @State private var searching = false
    @State private var isShowingSheet = false
    var folders = ["General", "Musicals", "My Songs", "Project Germany"]
    var body: some View {
        ZStack {
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
                            isCreatingFolder.toggle()
                        }) {
                            Text("New")
                        }
                    }
                }
            }
        if isCreatingFolder {
            NewFolderView()
        }
    }
}
    
    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct NewFolderView: View {
    @State private var newFolderName: String = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .fill(Color(.systemGray5))
                .frame(width: 250, height: 170, alignment: .center)
            VStack {
                Text("New Folder")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.label))
                Text("Enter a name for this folder")
                    .font(.body)
                Spacer()
                TextField("Name", text: $newFolderName)
                    .frame(width: 180, height: 2)
                    .padding()
                    .cornerRadius(7)
                    .foregroundColor(Color(.label))
                Spacer()
                HStack {
                    Button(action: {print("Cancel")}) {
                        Text("Cancel")
                            .frame(maxWidth: .infinity)
                    }
                    Button(action: {print("Save")}) {
                        Text("Save")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .frame(width: 250, height: 140)
        }
    }
}

struct FolderRow: View {
    var name: String
    var body: some View {
        Button(action: {
            
        })  {
            HStack {
                Image(systemName: "folder")
                    .font(.body)
//                    .foregroundColor(Color(.label))
                Text(name)
                    .font(.body)
                    .foregroundColor(Color(.label))
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}