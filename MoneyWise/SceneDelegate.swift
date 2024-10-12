//
//  SceneDelegate.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 12/10/24.
//

import UIKit

/// The SceneDelegate class is responsible for managing the window and the app's lifecycle events.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // The main window of the application that contains the app's views.
    var window: UIWindow?

    /// This method is called when the scene is about to connect to the app.
    ///
    /// Here, we manually create the window and set the root view controller programmatically.
    ///
    /// - Parameters:
    ///   - scene: The scene object that is being connected to the app.
    ///   - session: The session related to the scene.
    ///   - connectionOptions: Additional options for connecting the scene, such as handling URLs.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Ensure the scene is of type UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create a new UIWindow using the provided UIWindowScene
        window = UIWindow(windowScene: windowScene)
        
        // Initialize the root view controller of the application
        // Replace 'ViewController()' with the starting view controller of your app
        let rootViewController = ViewController()
        
        // Optionally, wrap the root view controller in a UINavigationController if navigation is required
        // let navigationController = UINavigationController(rootViewController: rootViewController)
        // window?.rootViewController = navigationController
        
        // Assign the root view controller to the window
        window?.rootViewController = rootViewController
        
        // Make the window visible
        window?.makeKeyAndVisible()
    }

    /// Called when the scene is disconnected from the app.
    ///
    /// Use this method to release resources that were associated with the scene.
    /// - Parameter scene: The scene being disconnected.
    func sceneDidDisconnect(_ scene: UIScene) {
        // Optional logic to handle the scene being disconnected from the app.
        // This is usually triggered when the app is closing or the scene goes to the background permanently.
    }

    /// Called when the scene moves from an inactive state to an active state.
    ///
    /// - Parameter scene: The scene that is becoming active.
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Restart any tasks that were paused or not started when the scene was inactive.
    }

    /// Called when the scene moves from an active state to an inactive state.
    ///
    /// - Parameter scene: The scene that is becoming inactive.
    func sceneWillResignActive(_ scene: UIScene) {
        // This method is called when the app is about to become inactive, such as when a phone call is received.
    }

    /// Called as the scene transitions from the background to the foreground.
    ///
    /// - Parameter scene: The scene that is entering the foreground.
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Use this method to undo changes made when the app entered the background.
        // For example, you can resume tasks that were paused when the app was backgrounded.
    }

    /// Called as the scene transitions from the foreground to the background.
    ///
    /// - Parameter scene: The scene that is entering the background.
    func sceneDidEnterBackground(_ scene: UIScene) {
        // This method is ideal for saving data before the app moves to the background.
        // For example, saving Core Data context to ensure data is persisted.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
