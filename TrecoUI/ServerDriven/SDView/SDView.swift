//
//  SDView.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import Foundation

struct SDView: Decodable {
    let settings: SDViewSettings?
    let body: [SDComponent]
    let header: SDNavigationBar?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.settings = try? container.decode(SDViewSettings.self, forKey: .settings)
        self.body = try container.decode([SDAnyComponent].self, forKey: .body).compactMap { $0.component }
        self.header = try? container.decode(SDNavigationBar.self, forKey: .header)
    }
    
    init(body: [SDComponent], header: SDNavigationBar? = nil, settings: SDViewSettings? = nil) {
        self.body = body
        self.header = header
        self.settings = settings
    }
}

extension SDView {
    private enum CodingKeys: CodingKey {
        case settings
        case body
        case header
    }
}
