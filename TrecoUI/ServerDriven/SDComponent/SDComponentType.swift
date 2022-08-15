//
//  SDComponentType.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//


import Foundation

enum SDComponentType: String, Decodable {
    case remoteImage = "SD_REMOTE_IMAGE_COMPONENT"
    case buttonRow = "SD_BUTTON_ROW_COMPONENT"
    case serviceCarousel = "SD_SERVICE_CAROUSEL_COMPONENT"
    case spacer = "SD_SPACER_COMPONENT"
}

extension SDComponentType {
    var metatype: SDComponent.Type {
        switch self {
        case .remoteImage:
            return SDRemoteImageComponent.self
        case .buttonRow:
            return SDButtonRowComponent.self
        case .serviceCarousel:
            return SDServiceCarouselComponent.self
        case .spacer:
            return SDSpacerComponent.self
        }
    }
}
