//
//  SDComponentType.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//


import Foundation

enum SDComponentType: String, Decodable {
    case image = "SDRemoteImageComponent"
}

extension SDComponentType {
    var metatype: SDComponent.Type {
        switch self {
        case .image:
            return SDRemoteImageComponent.self
        }
    }
}
