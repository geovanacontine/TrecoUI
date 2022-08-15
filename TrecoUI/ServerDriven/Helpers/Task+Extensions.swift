//
//  Task+Extensions.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}
