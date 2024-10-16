//
//  SceneDelegate.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 12/10/24.
//

import UIKit

/// The SceneDelegate class manages the app's window and scene lifecycle events.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    /// This method is called when the scene is about to connect to the app.
    ///
    /// Here, we create the window and set the root view controller programmatically.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Ensure the scene is of type UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create a new UIWindow using the provided UIWindowScene
        window = UIWindow(windowScene: windowScene)
        
        // Initialize the root view controller of the application (e.g., LaunchScreenViewController or MainViewController)
        let rootViewController = LaunchScreenViewController() // Or your main view controller
        
        // Set the root view controller
        window?.rootViewController = rootViewController
        
        // Make the window visible
        window?.makeKeyAndVisible()
    }

    /// Called when the scene moves from an inactive state to an active state.
    ///
    /// Use this to refresh data or the user interface when the app becomes active.
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Restart tasks that were paused when the app was inactive.
        // This can include refreshing the user interface or syncing data with a server.
        print("App is now active - refresh data if necessary")
    }

    /// Called when the scene moves from an active state to an inactive state.
    ///
    /// Save sensitive data or the current state of the app.
    func sceneWillResignActive(_ scene: UIScene) {
        // Pause ongoing tasks or disable features that should not run while the app is inactive.
        print("App is about to become inactive - consider saving current progress")
    }

    /// Called as the scene transitions from the background to the foreground.
    ///
    /// This is a good place to refresh any data or the UI that might need updating after being in the background.
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Undo changes made when the app entered the background.
        // For example, refresh the UI or sync with a backend.
        print("App is entering foreground - prepare UI for the user")
    }

    /// Called as the scene transitions from the foreground to the background.
    ///
    /// Save data or synchronize with a server before the app goes into the background.
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Save data if appropriate and sync with the server.
        // This is the time to ensure the app state is preserved in case it is terminated.
        print("App has entered background - save data and sync if necessary")
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
