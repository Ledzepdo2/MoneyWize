//
//  UserRepository.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 23/10/24.
//

import Foundation

// MARK: - UserRepositoryProtocol
/// Protocol that defines the contract for user repository interactions.
protocol UserRepositoryProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

// MARK: - UserRepository
/// Concrete implementation of the UserRepositoryProtocol for handling user-related operations.
class UserRepository: UserRepositoryProtocol {

    // MARK: - Public Methods
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Here you would add the logic to interact with your API or database to authenticate the user.
        // For example, you could send a network request to a backend service.

        // Simulate a network call with a delay for demonstration purposes.
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            if email == "user@example.com" && password == "password123" {
                completion(.success(()))
            } else {
                completion(.failure(LoginError.authenticationFailed))
            }
        }
    }
}
