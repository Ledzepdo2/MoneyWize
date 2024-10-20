//
//  NotificationNames.swift
//  MoneyWise
//
//  Created by Jesus Perez Mojica on 20/10/24.
//

import Foundation

// Custom notification names for login events
extension NSNotification.Name {
    static let loginSucceeded = NSNotification.Name("LoginSucceeded")
    static let loginFailed = NSNotification.Name("LoginFailed")
}
