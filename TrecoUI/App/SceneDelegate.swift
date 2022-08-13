//
//  SceneDelegate.swift
//  TrecoUI
//
//  Created by Pedro Contine on 13/08/22.
//

import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = Coordinator.shared.navigationController
        window?.makeKeyAndVisible()
        
        Coordinator.shared.show(
            SDGenericView(viewName: SDLocalViews.home.rawValue)
                .accentColor(Colors.brandPure.color)
                .toAny()
        )
    }
}
