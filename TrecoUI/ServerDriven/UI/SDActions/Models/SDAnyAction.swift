//
//  SDAnyAction.swift
//  TrecoUI
//
//  Created by Geovana Contine on 17/08/22.
//

import Foundation

final class SDAnyAction: Decodable {
    
    let action: SDAction?

    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(SDActionType.self, forKey: .type)
            self.action = try type.metatype.init(from: decoder)
        } catch {
            self.action = nil
        }
    }
}

extension SDAnyAction {
    private enum CodingKeys: CodingKey {
        case type
    }
}
