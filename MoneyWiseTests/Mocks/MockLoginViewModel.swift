//
//  MockLoginViewModel.swift
//  MoneyWiseTests
//
//  Created by Jesus Perez Mojica on 20/10/24.
//

import Foundation

// MARK: - Mock ViewModel
class MockLoginViewModel: LoginViewModelProtocol {
    var didAttemptLogin = false
    var shouldReturnError = false
    var shouldReturnSuccess = false
    var errorMessage: String?

    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        didAttemptLogin = true

        if shouldReturnError {
            let error = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: errorMessage ?? "Unknown error"])
            completion(.failure(error))
        } else if shouldReturnSuccess {
            completion(.success(()))
        }
    }

    // Simulate a login error scenario
    func simulateLoginError() {
        login(email: "", password: "") { result in
            switch result {
            case .failure(let error):
                NotificationCenter.default.post(name: .loginFailed, object: error.localizedDescription)
            default: break
            }
        }
    }

    // Simulate a login success scenario
    func simulateLoginSuccess() {
        login(email: "", password: "") { result in
            switch result {
            case .success:
                NotificationCenter.default.post(name: .loginSucceeded, object: nil)
            default: break
            }
        }
    }
}
