//
//  SDComponent.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import SwiftUI

protocol SDComponent: Decodable {
    var tag: String { get }
    func render() -> AnyView
}
