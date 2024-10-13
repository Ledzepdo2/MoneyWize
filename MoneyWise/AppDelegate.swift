//
//  AppDelegate.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 12/10/24.
//

import UIKit
import CoreData

/// The AppDelegate class serves as the entry point for app-wide configurations
/// and handles app lifecycle events such as launching, backgrounding, and termination.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - UIApplicationDelegate Methods

    /// Called when the application has finished launching.
    ///
    /// This is the initial setup method for app-wide configurations that need to occur
    /// when the app starts, such as setting up third-party services, background fetches,
    /// or initial data loading.
    ///
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - launchOptions: A dictionary indicating why the app was launched.
    /// - Returns: A Boolean value indicating whether the app successfully finished launching.
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    /// Called when a new scene session is being created.
    ///
    /// This method is used to return a configuration for creating the new scene.
    ///
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - connectingSceneSession: The session object containing scene-specific information.
    ///   - options: Options used to configure the scene's connection.
    /// - Returns: A UISceneConfiguration object with scene's configuration data.
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    /// Called when the user discards a scene session.
    ///
    /// If any sessions were discarded while the app was not running, this will be called
    /// shortly after `application(_:didFinishLaunchingWithOptions:)`.
    /// Use this method to release any resources specific to the discarded scenes.
    ///
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - sceneSessions: A set of UISceneSession objects that were discarded.
    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
        // Handle cleanup of any resources specific to discarded scenes.
    }

    // MARK: - Core Data Stack

    /// The persistent container that handles the Core Data stack.
    ///
    /// This container is responsible for setting up the Core Data environment, including
    /// loading the persistent store (the SQLite database, for example) and managing
    /// the object context.
    lazy var persistentContainer: NSPersistentContainer = {
        // The name of the Core Data model (MoneyWise) matches the .xcdatamodeld file.
        let container = NSPersistentContainer(name: "MoneyWise")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // Fatal errors are useful for debugging but should not be used in production.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // MARK: - Core Data Saving Support

    /// Saves any changes in the app's managed object context.
    ///
    /// This method checks if the managed object context has unsaved changes.
    /// If changes exist, it attempts to save them. In the event of an error,
    /// it logs the error details and terminates the app.
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                // Replace this with appropriate error handling in production.
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
