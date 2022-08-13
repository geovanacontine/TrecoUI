//
//  Coordinator.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI

enum NavigationTransitionStyle {
    case push
    case presentModally
    case presentFullscreen
}

class Coordinator {
    static let shared = Coordinator()
    private init() {}
    let navigationController = UINavigationController()
}

extension Coordinator {
    func show(_ view: AnyView, style: NavigationTransitionStyle = .push, animated: Bool = true) {
        let viewController = UIHostingController(rootView: view)
        
        switch style {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .presentModally:
            viewController.modalPresentationStyle = .formSheet
            navigationController.present(viewController, animated: animated)
        case .presentFullscreen:
            viewController.modalPresentationStyle = .fullScreen
            navigationController.present(viewController, animated: animated)
        }
    }
    
    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func dismiss(animated: Bool = true) {
        navigationController.dismiss(animated: true) { [weak self] in
            self?.navigationController.viewControllers = []
        }
    }
}
