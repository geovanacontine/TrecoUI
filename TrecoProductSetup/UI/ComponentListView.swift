//
//  ComponentListView.swift
//  Product Setup
//
//  Created by Geovana Contine on 02/09/22.
//

import SwiftUI

struct ComponentListView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Components")) {
                    NavigationLink(destination: ComponentDetailView(name: "buttonRow")) {
                        Label("Button Row", systemImage: "doc")
                    }
                    NavigationLink(destination: ComponentDetailView(name: "button")) {
                        Label("Button", systemImage: "doc")
                    }
                    NavigationLink(destination: ComponentDetailView(name: "header")) {
                        Label("Header", systemImage: "doc")
                    }
                    NavigationLink(destination: ComponentDetailView(name: "carousel")) {
                        Label("Carousel", systemImage: "doc")
                    }
                    NavigationLink(destination: ComponentDetailView(name: "spacer")) {
                        Label("Spacer", systemImage: "doc")
                    }
                    NavigationLink(destination: ComponentDetailView(name: "section")) {
                        Label("Section", systemImage: "doc")
                    }
                }
            }
            .listStyle(.sidebar)
            
            ComponentDetailView(name: "buttonRow")
        }
    }
}
