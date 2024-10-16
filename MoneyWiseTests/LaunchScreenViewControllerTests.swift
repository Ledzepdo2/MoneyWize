//
//  LaunchScreenViewControllerTests.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 16/10/24.
//

import XCTest
@testable import MoneyWise

/// `LaunchScreenViewControllerTests` contains unit tests for the `LaunchScreenViewController` to ensure correct behavior.
class LaunchScreenViewControllerTests: XCTestCase {

    var sut: LaunchScreenViewController!  // System Under Test (SUT)

    // MARK: - Setup and Teardown
    
    /// Called before each test method in the class is invoked. Sets up the SUT and loads its view.
    override func setUpWithError() throws {
        super.setUp()
        sut = LaunchScreenViewController()
        sut.loadViewIfNeeded()  // Ensure the view hierarchy is loaded
    }

    /// Called after each test method in the class completes. Cleans up resources used by the SUT.
    override func tearDownWithError() throws {
        sut = nil  // Release SUT
        super.tearDown()
    }

    // MARK: - Unit Tests
    
    /// Verifies that the background color of the view is set to the custom `mWBlue` color.
    func testBackgroundColorIsMWBlue() {
        XCTAssertEqual(sut.view.backgroundColor, UIColor(named: "mWBlue"), "The background color should be mWBlue")
    }

    /// Verifies that the logo image view is added to the view hierarchy and has the correct size constraints (200x200).
    func testLogoImageIsAddedToView() {
        // Force layout updates to apply SnapKit constraints
        sut.view.layoutIfNeeded()
        
        let logoImageView = sut.view.subviews.first(where: { $0 is UIImageView }) as? UIImageView
        XCTAssertNotNil(logoImageView, "The logo image view should be added to the view hierarchy")
        
        // Ensure the image is correctly set
        XCTAssertEqual(logoImageView?.image, UIImage(named: "AppIcon"), "The logo image should be 'AppIcon'")
        
        // Verify the logo size is 200x200 as defined in the layout
        let expectedSize = CGSize(width: 200, height: 200)
        XCTAssertEqual(logoImageView?.frame.size, expectedSize, "The logo image view should have a width and height of 200")
    }
}
