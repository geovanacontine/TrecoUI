//
//  SceneDelegate.swift
//  TrecoUI
//
//  Created by Geovana Contine on 13/08/22.
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
                .preferredColorScheme(.light)
                .accentColor(Colors.brandPure.color)
                .toAny()
        )
    }
}
