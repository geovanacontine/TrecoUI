//
//  SDSectionComponent.swift
//  TrecoUI
//
//  Created by Geovana Contine on 16/08/22.
//

import SwiftUI

struct SDSectionComponent: SDComponent {
    let tag: String
    let data: SectionView.Data
    
    func render() -> AnyView {
        SectionView(data: data).toAny()
    }
}

struct SectionView: View {
    let data: Data
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Colors.neutralLight2.color)
                .frame(height: 2)
                .isVisible(data.hasSeparator == true)
            SpacerView(vertical: .sm)
            HStack {
                SpacerView(horizontal: .sm)
                VStack {
                    HStack {
                        Text(data.title ?? "")
                            .textStyle(.heading4)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .isVisible(data.hasDisclosure ?? false)
                            .foregroundColor(Colors.neutralDark2.color)
                    }
                    VStack {
                        SpacerView(vertical: .sm)
                        HStack {
                            Text(data.subtitle ?? "")
                                .textStyle(.description)
                            Spacer()
                        }
                    }
                    .isVisible(data.subtitle != nil)
                    VStack {
                        SpacerView(vertical: .xs)
                        HStack {
                            Text(data.accessory ?? "")
                                .textStyle(.heading4)
                            Spacer()
                        }
                    }
                    .isVisible(data.accessory != nil)
                }
                SpacerView(horizontal: .sm)
            }
            
            VStack {
                SpacerView(vertical: .sm)
                LazyVStack(spacing: Spacing.xs.value) {
                    ForEach(data.components ?? [], id: \.component?.tag) { component in
                        component.component?.render()
                    }
                }
            }
            .isVisible(data.components != nil)
            SpacerView(vertical: .sm)
        }
        .background(Colors.neutralLightPure.color)
    }
}

extension SectionView {
    struct Data: Decodable {
        let title: String?
        let subtitle: String?
        let accessory: String?
        let hasDisclosure: Bool?
        let hasSeparator: Bool?
        let components: [SDAnyComponent]?
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(data: .init(
            title: "Title",
            subtitle: "Subtitle",
            accessory: "Acessory",
            hasDisclosure: true,
            hasSeparator: true,
            components: nil)
        )
    }
}
