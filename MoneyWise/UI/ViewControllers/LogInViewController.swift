//
//  LoginViewController.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 12/10/24.
//

import UIKit

/// `LoginViewController` is responsible for managing the login view.
/// It handles user input, validates credentials, and triggers the login process through the ViewModel.
class LoginViewController: UIViewController {

    // MARK: - UI Components
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    // MARK: - Properties
    var viewModel: LoginViewModelProtocol?  // Dependency injection of ViewModel

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setup UI
    private func setupView() {
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, errorLabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        
        // Using AutoLayout (or SnapKit can be used here)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }

    // MARK: - Actions
    /// Called when the user taps the login button.
    /// This method validates user input and triggers the login process through the ViewModel.
    @objc func loginButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            displayError("Email and Password must not be empty")
            return
        }

        // Clear any previous errors
        errorLabel.isHidden = true
        
        // Call ViewModel to handle login logic
        viewModel?.login(email: email, password: password, completion: { [weak self] result in
            switch result {
            case .success:
                self?.navigateToDashboard()
            case .failure(let error):
                self?.displayError(error.localizedDescription)
            }
        })
    }

    // MARK: - Navigation
    /// Navigate to the dashboard screen upon successful login.
    private func navigateToDashboard() {
        //let dashboardViewController = DashboardViewController()
        //navigationController?.pushViewController(dashboardViewController, animated: true)
    }

    // MARK: - Error Handling
    /// Display an error message to the user.
    ///
    /// - Parameter message: The error message to display.
    private func displayError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
}
