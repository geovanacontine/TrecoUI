//
//  ContentView.swift
//  TrecoProductSetup
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI
import Swifter

struct ContentView: View {
    
    private var statusColor: Colors {
        ServerManager.shared.isOn ? .feedbackSuccess : .feedbackError
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Status:")
                    .textStyle(.heading4)
                Text(ServerManager.shared.isOn ? "ON" : "OFF")
                    .foregroundColor(statusColor.color)
                    .textStyle(.heading4)
            }
            SpacerView(vertical: .xxxs)
            Text(SDServerSettings.baseEndpoint)
                .textStyle(.caption)
        }
    }
}
