//
//  TrecoProductSetupApp.swift
//  TrecoProductSetup
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI

@main
struct TrecoProductSetupApp: App {
    
    init() {
        TokensManager.shared.setTheme(fromJson: "tokens")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .frame(minWidth: 400, maxWidth: 800, minHeight: 300, maxHeight: 500)
        }
    }
}
