//
//  SDActionType.swift
//  TrecoUI
//
//  Created by Geovana Contine on 17/08/22.
//

import Foundation

enum SDActionType: String, Decodable {
    case navigation = "SD_NAVIGATION_ACTION"
}

extension SDActionType {
    var metatype: SDAction.Type {
        switch self {
        case .navigation:
            return SDNavigationAction.self
        }
    }
}
