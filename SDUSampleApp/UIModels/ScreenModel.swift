//
//  OnBoardingModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 20/09/23.
//

import Foundation
// MARK: - ScreenModel
struct ScreenModel: Decodable {
    var screenIdentifier: String?
    var padding: Padding?
    var body: Body?

    enum CodingKeys: String, CodingKey {
        case screenIdentifier = "screen_identifier"
        case padding, body
    }
}

// MARK: - Body
struct Body: Decodable {
    var type, identifier: String?
    var fields: [Field]?
}

struct Padding: Decodable {
    var left, right, top, bottom: Int?
}

// MARK: - Field
struct Field: Decodable {
    var type:ComponentsType?
    var identifier: String?
    var properties: Properties?
}

enum ComponentsType: String, Decodable {
    case textField
    case button
    case label
}

// MARK: - Properties
struct Properties: Codable {
    var label, placeHolder: String?
    var mandatory: Bool?
    var accessibility: Accessibility?
    var allowedRegex, textFieldType: String?
    var validation: Validation?
    var title, url: String?
    var action: Action?
    var color:String?
    var backgroundColor: String?
    
    enum CodingKeys: String, CodingKey {
        case label, placeHolder, mandatory, accessibility
        case allowedRegex = "allowed_regex"
        case textFieldType, validation, title, url, action
        case color
        case backgroundColor
    }
}

// MARK: - Accessibility
struct Accessibility: Codable {
    var label, identifier: String?
}

// MARK: - Action
struct Action: Codable {
    var type, destination, navigationType: String?
}

// MARK: - Validation
struct Validation: Codable {
    var max, min: Max?
    var regex: String?
}

// MARK: - Max
struct Max: Codable {
    var value: Int?
    var message: String?
}
