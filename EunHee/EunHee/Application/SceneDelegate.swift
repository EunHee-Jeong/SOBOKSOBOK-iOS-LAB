//
//  SceneDelegate.swift
//  EunHee
//
//  Created by 정은희 on 2022/01/07.
//

import UIKit

import EasyKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let vc = SignInViewController.instanceFromNib()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
    }
}

