//
//  SDButtonRowComponent.swift
//  TrecoUI
//
//  Created by Geovana Contine on 15/08/22.
//

import SwiftUI

struct SDButtonRowComponent: SDComponent {
    let tag: String
    let data: ButtonRowView.Data
    
    func render() -> AnyView {
        ButtonRowView(data: data).toAny()
    }
}

struct ButtonRowView: View {
    let data: Data
    
    var body: some View {
        HStack {
            SpacerView(horizontal: .sm)
            HStack {
                Image(systemName: data.icon ?? "")
                SpacerView(horizontal: .xs)
                Text(data.title ?? "")
                    .textStyle(.description, color: Colors.neutralDarkPure.color)
                Spacer()
                Text(data.subtitle ?? "")
                    .textStyle(.description, color: Colors.brandPure.color)
            }
            .padding()
            .background(Colors.neutralLight2.color)
            .addBorder(radius: .md)
            SpacerView(horizontal: .sm)
        }
    }
}

extension ButtonRowView {
    struct Data: Decodable {
        let icon: String?
        let title: String?
        let subtitle: String?
    }
}

struct ButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRowView(data: .init(icon: "lanyardcard",
                                  title: "Meus cartões",
                                  subtitle: "Conhecer"))
    }
}
