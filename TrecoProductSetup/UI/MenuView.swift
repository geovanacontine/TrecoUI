//
//  MenuView.swift
//  ProductSetup
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var fileManager: FileViewManager
    
    var body: some View {
        List {
            Section(header: Text("Settings")) {
                NavigationLink(destination: SettingsView()) {
                    Label("Server", systemImage: "network")
                }
            }
            
            Section(header: Text("Add")) {
                NavigationLink(destination: Text("...")) {
                    Label("New Theme", systemImage: "plus.circle")
                }
                NavigationLink(destination: FileDetailView(viewName: "viewName")) {
                    Label("New View", systemImage: "plus.circle")
                }
            }
            
            Section(header: Text("Themes")) {
                NavigationLink(destination: Text("...")) {
                    Label("Nubank", systemImage: "paintbrush")
                }
            }
            
            Section(header: Text("Views")) {
                ForEach(fileManager.views, id: \.self) { viewName in
                    NavigationLink(destination: FileDetailView(viewName: viewName)) {
                        Label(viewName, systemImage: "doc")
                    }
                }
            }
        }
        .listStyle(.sidebar)
    }
}
