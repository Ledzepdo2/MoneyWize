//
//  LoginViewModel.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 20/10/24.
//

import Foundation

// MARK: - Protocol to define the interface of the ViewModel
protocol LoginViewModelProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

// MARK: - ViewModel responsible for managing the login logic
class LoginViewModel: LoginViewModelProtocol {

    // MARK: - Properties
    private let loginUseCase: LoginUseCaseProtocol

    // MARK: - Initializer
    init(loginUseCase: LoginUseCaseProtocol) {
        self.loginUseCase = loginUseCase
    }

    // MARK: - Public Methods
    /// Attempts to log in the user with the given credentials
    /// - Parameters:
    ///   - email: The user's email address
    ///   - password: The user's password
    ///   - completion: A completion handler that returns success or failure
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Perform basic validation
        guard isValidEmail(email) else {
            completion(.failure(LoginError.invalidEmail))
            return
        }
        
        guard !password.isEmpty else {
            completion(.failure(LoginError.emptyPassword))
            return
        }

        // Call the login use case with validated credentials
        loginUseCase.execute(email: email, password: password) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - Private Methods

    /// Validates the email format
    /// - Parameter email: Email string to validate
    /// - Returns: Boolean indicating whether the email format is valid
    private func isValidEmail(_ email: String) -> Bool {
        // Regular expression to check email format
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
}

// MARK: - Login Errors
enum LoginError: LocalizedError {
    case invalidEmail
    case emptyPassword
    case authenticationFailed

    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return "Please enter a valid email address."
        case .emptyPassword:
            return "Password cannot be empty."
        case .authenticationFailed:
            return "Authentication failed. Please check your credentials and try again."
        }
    }
}

// MARK: - Protocol for the login use case (Dependency Injection)
protocol LoginUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}
