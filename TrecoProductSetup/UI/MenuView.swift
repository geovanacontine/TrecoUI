//
//  MenuView.swift
//  ProductSetup
//
//  Created by Geovana Contine on 13/08/22.
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
                Button(action: {
                    ComponentListView().openNewWindow(title: "Component List")
                }) {
                     Label("Components", systemImage: "puzzlepiece")
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Section(header: Text("Add")) {
                NavigationLink(destination: FileDetailView(viewName: "viewName")) {
                    Label("New View", systemImage: "plus.circle")
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

extension View {
    private func newWindowInternal(with title: String) -> NSWindow {
        let window = NSWindow(
            contentRect: NSRect(x: 20, y: 20, width: 680, height: 600),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false)
        window.center()
        window.isReleasedWhenClosed = false
        window.title = title
        window.makeKeyAndOrderFront(nil)
        return window
    }
    
    func openNewWindow(title: String) {
        self.newWindowInternal(with: title).contentView = NSHostingView(rootView: self)
    }
}
