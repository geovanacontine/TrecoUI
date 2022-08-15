//
//  SettingsView.swift
//  ProductSetup
//
//  Created by Geovana Contine on 13/08/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var server: ServerManager
    
    private var status: String {
        server.isOn ? "ON" : "OFF"
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Status")
                Spacer()
                Toggle(status, isOn: $server.isOn)
                    .accentColor(Colors.feedbackSuccess.color)
                    .toggleStyle(.switch)
                    .onChange(of: server.isOn) { isOn in
                        isOn ? server.start() : server.stop()
                    }
            }
            Divider()
            HStack {
                Text("Endpoint")
                Spacer()
                Text(SDServerSettings.baseEndpoint)
            }
            Spacer()
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
