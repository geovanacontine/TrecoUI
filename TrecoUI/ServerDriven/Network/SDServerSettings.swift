//
//  SDServerSettings.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import Foundation

struct SDServerSettings {
    static let port: UInt16 = 3000
    
    static var baseEndpoint: String {
        let portString = String(port)
        return "http://localhost:\(portString)/view/"
    }
}
