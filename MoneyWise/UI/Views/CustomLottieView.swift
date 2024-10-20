//
//  CustomLottieView.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 19/10/24.
//

import UIKit
import Lottie
import SnapKit

/// A reusable LottieAnimationView that can be used to display animations.
class CustomLottieView: UIView {

    // MARK: - Properties
    private var animationView: LottieAnimationView?

    // MARK: - Initializer

    /// Initialize with an animation name.
    ///
    /// - Parameter animationName: The name of the Lottie animation JSON file.
    init(animationName: String) {
        super.init(frame: .zero)
        setupAnimation(with: animationName)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    /// Setup the Lottie animation view and its constraints using SnapKit.
    ///
    /// - Parameter animationName: The name of the animation file (without .json extension).
    private func setupAnimation(with animationName: String) {
        // Initialize the LottieAnimationView
        animationView = LottieAnimationView(name: animationName)
        guard let animationView = animationView else { return }

        animationView.contentMode = .scaleAspectFit  // Set content mode
        animationView.loopMode = .loop               // Set animation to loop
        animationView.animationSpeed = 1.0           // Default animation speed

        // Add the animation view to the main view
        addSubview(animationView)

        // Use SnapKit to set constraints (fill the entire view)
        animationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - Public Methods

    /// Play the Lottie animation.
    func playAnimation() {
        animationView?.play()
    }

    /// Stop the Lottie animation.
    func stopAnimation() {
        animationView?.stop()
    }

    /// Pause the Lottie animation.
    func pauseAnimation() {
        animationView?.pause()
    }

    /// Set the loop mode of the animation.
    ///
    /// - Parameter loopMode: The `LottieLoopMode` to set (e.g., `.loop`, `.playOnce`).
    func setLoopMode(_ loopMode: LottieLoopMode) {
        animationView?.loopMode = loopMode
    }

    /// Adjust the animation speed.
    ///
    /// - Parameter speed: The speed of the animation (1.0 is default speed).
    func setAnimationSpeed(_ speed: CGFloat) {
        animationView?.animationSpeed = speed
    }

    /// Set the progress of the animation manually.
    ///
    /// - Parameter progress: A value between 0.0 and 1.0 indicating the animation progress.
    func setAnimationProgress(_ progress: CGFloat) {
        animationView?.currentProgress = progress
    }
}
