//
//  SDServiceCarouselComponent.swift
//  TrecoUI
//
//  Created by Geovana Contine on 15/08/22.
//

import SwiftUI

struct SDServiceCarouselComponent: SDComponent {
    let tag: String
    let data: ServiceCarouselView.Data
    
    func render() -> AnyView {
        ServiceCarouselView(data: data).toAny()
    }
}

struct ServiceCarouselView: View {
    let data: Data
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                SpacerView(horizontal: .xs)
                LazyHStack(spacing: Spacing.xs.value) {
                    ForEach(data.items ?? [], id: \.title) { item in
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(Colors.neutralLight2.color)
                                    .frame(width: 72, height: 72)
                                Image(systemName: item.icon ?? "")
                            }
                            SpacerView(vertical: .xxs)
                            Text(item.title ?? "")
                                .textStyle(.description, color: Colors.neutralDarkPure.color)
                        }
                    }
                }
                SpacerView(horizontal: .xs)
            }
        }
    }
}

extension ServiceCarouselView {
    struct Data: Decodable {
        let items: [ServiceItem]?
    }
    
    struct ServiceItem: Decodable {
        let icon: String?
        let title: String?
    }
}

struct ServiceCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceCarouselView(data: .init(items: [
            .init(icon: "lanyardcard", title: "Cartão1"),
            .init(icon: "lanyardcard", title: "Cartão2"),
            .init(icon: "lanyardcard", title: "Cartão3")
        ]))
    }
}
