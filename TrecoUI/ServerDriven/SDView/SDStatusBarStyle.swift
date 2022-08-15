//
//  SDStatusBarStyle.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
//

import UIKit

enum SDStatusBarStyle: String {
    case light
    case dark
    
    var systemStyle: UIStatusBarStyle {
        switch self {
        case .light:
            return .lightContent
        case .dark:
            return .darkContent
        }
    }
}
