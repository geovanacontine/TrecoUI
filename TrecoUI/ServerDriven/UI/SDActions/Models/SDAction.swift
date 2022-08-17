//
//  SDAction.swift
//  TrecoUI
//
//  Created by Geovana Contine on 17/08/22.
//

import Foundation

protocol SDAction: Decodable {
    func execute()
}
