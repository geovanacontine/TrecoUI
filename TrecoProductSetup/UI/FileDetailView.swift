//
//  FileDetailView.swift
//  ProductSetup
//
//  Created by Geovana Contine on 14/08/22.
//

import SwiftUI
import CodeEditor

struct FileDetailView: View {
    
    @EnvironmentObject var fileManager: FileViewManager
    
    @State private var shouldShowDeleteAlert = false
    @State private var shouldShowSaveAlert = false
    @State private var name: String = ""
    @State private var text: String = ""
    
    private let viewName: String
    private let defaults: UserDefaults
    
    init(viewName: String, defaults: UserDefaults = UserDefaults.standard) {
        self.viewName = viewName
        self.defaults = defaults
    }
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
            CodeEditor(source: $text, language: .json, theme: .atelierSavannaDark, flags: [.selectable, .editable, .smartIndent])
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button {
                    shouldShowDeleteAlert = true
                } label: {
                    Text("Delete")
                }
                .alert(isPresented: $shouldShowDeleteAlert) {
                    Alert(title: Text("Delete View"),
                          message: Text("Are you sure you want to permanently remove this item?"),
                          primaryButton: .destructive(Text("Delete"), action: { fileManager.deleteFile(name: viewName) }),
                          secondaryButton: .cancel())
                }
                
                Button {
                    shouldShowSaveAlert = true
                    fileManager.saveFile(oldName: viewName, newName: name, text: text)
                } label: {
                    Text("Save")
                }
                .alert(isPresented: $shouldShowSaveAlert) {
                    Alert(title: Text("View saved succesfully!"),
                          message: nil,
                          dismissButton: nil)
                }
            }
        }
        .onAppear {
            name = viewName
            text = fileManager.loadJsonText(forView: viewName) ?? getEmptyViewJson()
        }
    }
    
    private func getEmptyViewJson() -> String {
        """
        {
          "header" : {
            "title" : "Title"
          },
          "body" : [
            
          ]
        }
        """
    }
}
