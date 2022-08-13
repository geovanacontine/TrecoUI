//
//  RemoteImageView.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI

struct SDRemoteImageComponent: SDComponent {
    let tag: String
    let data: RemoteImageView.Data
    
    func render() -> AnyView {
        RemoteImageView(data: data).toAny()
    }
}

struct RemoteImageView: View {
    let data: Data
    
    private var url: URL? {
        .init(string: data.url ?? "")
    }
    
    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            Colors.neutralDark3.color
        }
        .frame(height: data.estimatedHeight)
        .addBorder(radius: data.borderRadius ?? .none,
                   width: data.borderWidth ?? .none,
                   color: data.borderColor ?? .clear)
    }
}

extension RemoteImageView {
    struct Data: Decodable {
        let url: String?
        let estimatedHeight: CGFloat?
        let borderRadius: BorderRadius?
        let borderWidth: BorderWidth?
        let borderColor: Colors?
    }
}
