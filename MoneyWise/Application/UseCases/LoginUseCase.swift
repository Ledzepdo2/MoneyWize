//
//  LoginUseCase.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 23/10/24.
//

import Foundation

// MARK: - LoginUseCaseProtocol
/// Protocol defining the interface for the login use case.
protocol LoginUseCaseProtocol {
    func execute(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

// MARK: - LoginUseCase
/// Use case responsible for handling user login logic.
class LoginUseCase: LoginUseCaseProtocol {

    // MARK: - Properties
    private let repository: UserRepositoryProtocol

    // MARK: - Initializer
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Public Methods
    /// Executes the login process by calling the repository to validate credentials.
    /// - Parameters:
    ///   - email: User's email
    ///   - password: User's password
    ///   - completion: Completion handler with success or failure.
    func execute(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        repository.login(email: email, password: password) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
