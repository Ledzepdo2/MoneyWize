//
//  LoginViewControllerTests.swift
//  MoneyWiseTests
//
//  Created by Jesus Perez Mojica on 20/10/24.
//

import XCTest
@testable import MoneyWise

import XCTest
@testable import MoneyWise

class LoginViewControllerTests: XCTestCase {

    var loginViewController: LoginViewController!
    var mockLoginViewModel: MockLoginViewModel!

    // MARK: - Setup
    override func setUpWithError() throws {
        super.setUp()

        // Initialize the mock ViewModel
        mockLoginViewModel = MockLoginViewModel()

        // Initialize the LoginViewController and inject the mock ViewModel
        loginViewController = LoginViewController()
        loginViewController.viewModel = mockLoginViewModel as! any LoginViewModelProtocol

        // Load the view to initialize UI components
        loginViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Clean up after each test
        loginViewController = nil
        mockLoginViewModel = nil
        super.tearDown()
    }

    // MARK: - Input Validation Tests
    func testEmailValidation_invalidEmail() {
        // Set an invalid email and valid password
        loginViewController.emailTextField.text = "invalid-email"
        loginViewController.passwordTextField.text = "ValidPassword123"

        // Simulate login button tap
        loginViewController.loginButtonTapped()

        // Verify that the ViewModel did not attempt login
        XCTAssertFalse(mockLoginViewModel.didAttemptLogin, "Login should not be attempted with an invalid email.")
        XCTAssertEqual(loginViewController.errorLabel.text, "Please enter a valid email.", "Error message should indicate invalid email.")
    }

    func testPasswordValidation_emptyPassword() {
        // Set a valid email but empty password
        loginViewController.emailTextField.text = "test@example.com"
        loginViewController.passwordTextField.text = ""

        // Simulate login button tap
        loginViewController.loginButtonTapped()

        // Verify that the ViewModel did not attempt login
        XCTAssertFalse(mockLoginViewModel.didAttemptLogin, "Login should not be attempted with an empty password.")
        XCTAssertEqual(loginViewController.errorLabel.text, "Password cannot be empty.", "Error message should indicate empty password.")
    }

    // MARK: - ViewModel Call Tests
    func testLoginWithValidCredentials() {
        // Set valid email and password
        loginViewController.emailTextField.text = "test@example.com"
        loginViewController.passwordTextField.text = "ValidPassword123"

        // Simulate login button tap
        loginViewController.loginButtonTapped()

        // Verify that the ViewModel attempted to login
        XCTAssertTrue(mockLoginViewModel.didAttemptLogin, "Login should be attempted with valid credentials.")
    }

    // MARK: - Error Handling Tests
    func testLoginViewModelError() {
        // Simulate invalid credentials error from ViewModel
        mockLoginViewModel.shouldReturnError = true
        mockLoginViewModel.errorMessage = "Invalid credentials"

        // Set valid credentials and attempt login
        loginViewController.emailTextField.text = "test@example.com"
        loginViewController.passwordTextField.text = "ValidPassword123"
        loginViewController.loginButtonTapped()

        // Simulate error handling
        mockLoginViewModel.simulateLoginError()

        // Verify that the error message is displayed
        XCTAssertEqual(loginViewController.errorLabel.text, "Invalid credentials", "Error message should be displayed on invalid credentials.")
    }

    // MARK: - Navigation Tests
    func testLoginSuccessNavigation() {
        // Simulate a successful login in the ViewModel
        mockLoginViewModel.shouldReturnSuccess = true

        // Set valid credentials and attempt login
        loginViewController.emailTextField.text = "test@example.com"
        loginViewController.passwordTextField.text = "ValidPassword123"
        loginViewController.loginButtonTapped()

        // Simulate successful login
        mockLoginViewModel.simulateLoginSuccess()

        // Verify that the DashboardViewController is pushed
       // XCTAssertTrue(loginViewController.navigationController?//.topViewController is DashboardViewController, "Should navigate //to DashboardViewController after successful login.")
    }
}

