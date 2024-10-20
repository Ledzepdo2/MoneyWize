//
//  LaunchScreenViewController.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 16/10/24.
//

import UIKit
import SnapKit

/// `LaunchScreenViewController` is responsible for displaying the launch screen of the MoneyWise app.
/// This view simulates a launch screen with a logo and transitions to the main app interface.
class LaunchScreenViewController: UIViewController {

    // MARK: - Lifecycle
    
    /// Called after the controller's view is loaded into memory.
    /// This method sets up the view's background color, adds the logo, and triggers the transition to the main app.
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addLogoImage()
        transitionToMainViewController(after: 2)
    }

    // MARK: - Private Methods
    
    /// Sets up the view's properties such as background color.
    private func setupView() {
        view.backgroundColor = .mWBlue
    }

    /// Adds the logo image to the center of the view using SnapKit for layout.
    private func addLogoImage() {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "AppIcon") // Replace with actual image name
        view.addSubview(logoImageView)
        
        // Set constraints using SnapKit to center the image and set its size
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()  // Center the logo in the view
            make.width.height.equalTo(200)  // Set width and height to 200 points
        }
    }

    /// Simulates a loading process by transitioning to the main view controller after a delay.
    ///
    /// - Parameter delay: The delay in seconds before the transition happens.
    private func transitionToMainViewController(after delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            let mainViewController = LoginViewController()  // Main app's view controller
            mainViewController.modalTransitionStyle = .crossDissolve
            mainViewController.modalPresentationStyle = .fullScreen
            self.present(mainViewController, animated: true, completion: nil)
        }
    }
}
