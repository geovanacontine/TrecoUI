//
//  SDHeaderComponent.swift
//  TrecoUI
//
//  Created by Geovana Contine on 17/08/22.
//

import SwiftUI

struct SDHeaderComponent: SDComponent {
    let tag: String
    let data: HeaderView.Data
    
    func render() -> AnyView {
        HeaderView(data: data).toAny()
    }
}

struct HeaderView: View {
    let data: Data
    
    var body: some View {
        HStack {
            SpacerView(horizontal: .sm)
            VStack(alignment: .leading) {
                Text(data.title ?? "")
                    .textStyle(.heading2)
                SpacerView(vertical: .xs)
                Text(data.subtitle ?? "")
                    .textStyle(.paragraph, color: Colors.neutralDark2.color)
            }
            Spacer()
            SpacerView(horizontal: .sm)
        }
        .background(Colors.neutralLightPure.color)
    }
}

extension HeaderView {
    struct Data: Decodable {
        let title: String?
        let subtitle: String?
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(data: .init(title: "Title",
                               subtitle: "Subtitle"))
    }
}
