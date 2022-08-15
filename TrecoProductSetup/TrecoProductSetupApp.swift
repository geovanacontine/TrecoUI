//
//  TrecoProductSetupApp.swift
//  TrecoProductSetup
//
//  Created by Geovana Contine on 13/08/22.
//

import SwiftUI

@main
struct TrecoProductSetupApp: App {
    
    private let serverManager = ServerManager()
    
    init() {
        TokensManager.shared.setTheme(fromJson: "tokens")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .accentColor(Colors.brandPure.color)
                .frame(minWidth: 400, minHeight: 300)
                .environmentObject(serverManager)
                .environmentObject(FileViewManager.shared)
        }
    }
}
