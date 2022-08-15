//
//  ContentView.swift
//  TrecoProductSetup
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI
import Swifter

struct ContentView: View {
    var body: some View {
        NavigationView {
            MenuView()
            SettingsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
