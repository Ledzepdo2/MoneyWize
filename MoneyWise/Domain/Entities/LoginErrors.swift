//
//  LoginErrors.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 23/10/24.
//

import Foundation

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
