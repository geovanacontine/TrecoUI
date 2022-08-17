//
//  SDSpacerComponent.swift
//  TrecoUI
//
//  Created by Geovana Contine on 15/08/22.
//

import SwiftUI

struct SDSpacerComponent: SDComponent {
    let tag: String
    let data: Data
    
    func render() -> AnyView {
        SpacerView(vertical: .init(fromRawValue: data.vertical ?? "")).toAny()
    }
}

extension SDSpacerComponent {
    struct Data: Decodable {
        let vertical: String?
    }
}
