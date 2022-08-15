//
//  SDAnyComponent.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import Foundation

final class SDAnyComponent: Decodable {
    
    let component: SDComponent?

    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(SDComponentType.self, forKey: .type)
            self.component = try type.metatype.init(from: decoder)
        } catch {
            self.component = nil
        }
    }
}

extension SDAnyComponent {
    private enum CodingKeys: CodingKey {
        case type
    }
}
