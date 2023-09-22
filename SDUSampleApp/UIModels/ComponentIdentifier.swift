//
//  File.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 20/09/23.
//

import Foundation

enum ComponentIdentifier: String, CaseIterable, Decodable {
    case usernameTextField = "username_text_field"
    case passwordTextField = "password_text_field"
    case loginButton = "login_button"
    case forgotPasswordButton = "forgot_password_button"
    case contentScrollView = "content_scroll_view"
    case unknown = "unknown" // Add this case for unknown types
    
    // Define an initializer to handle unknown cases during decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        // Set the enum case to unknown if the raw value is not recognized
        if let component = ComponentIdentifier(rawValue: rawValue) {
            self = component
        } else {
            self = .unknown
        }
    }
}
