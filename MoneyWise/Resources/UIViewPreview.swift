//
//  UIViewPreview.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 27/10/24.
//

import SwiftUI
import UIKit

/// `UIViewControllerPreview` is a SwiftUI wrapper that enables previewing UIKit `UIViewController`
/// in SwiftUI's preview provider. This is especially useful for UIKit-based apps that want to leverage
/// SwiftUI's preview capabilities.
///
/// This wrapper takes a `UIViewController` instance, allowing it to be rendered in SwiftUI preview
/// while maintaining all UIKit properties.
struct UIViewControllerPreview: UIViewRepresentable {
    
    // MARK: - Properties
    
    /// The `UIViewController` instance to be previewed.
    let viewController: UIViewController

    // MARK: - Initializer
    
    /// Initializes the `UIViewControllerPreview` with a builder closure for creating the desired view controller.
    ///
    /// - Parameter builder: A closure that returns a `UIViewController` instance to preview.
    init(_ builder: @escaping () -> UIViewController) {
        self.viewController = builder()
    }

    // MARK: - UIViewRepresentable Methods
    
    /// Creates and returns the `UIView` to be displayed in the preview, initialized with the
    /// `UIViewController`'s main view.
    ///
    /// - Parameter context: Contextual information about the preview environment.
    /// - Returns: The main view of the wrapped `UIViewController`.
    func makeUIView(context: Context) -> UIView {
        return viewController.view
    }

    /// Updates the `UIView` instance with new data from the SwiftUI context, if any.
    ///
    /// - Parameters:
    ///   - uiView: The `UIView` instance to be updated.
    ///   - context: Contextual information about the preview environment.
    func updateUIView(_ uiView: UIView, context: Context) {}
}
