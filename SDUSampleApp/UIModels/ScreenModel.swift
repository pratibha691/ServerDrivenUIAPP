//
//  ScreenModel.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import Foundation
import UIKit
// MARK: - ScreenModel
struct ScreenModel: Decodable {
    let screen: String?
    let title: ScreenTitle?
    let elements: [ScreenElement]?
}

// MARK: - Element
struct ScreenElement: Decodable {
    let id: Int
    let type: ComponentType?
    let text: String?
    let style: ScreenElementStyle
    let placeholder, key: String?
    let secure: Bool?
    let action: String?
    let padding: Padding?
    let identifier: String?
}

enum ComponentType: String, Decodable {
    case label
    case textInput
    case button
}

// MARK: - Padding
struct Padding: Decodable {
    let paddingLeft, paddingRight, top, bottom: Int

    enum CodingKeys: String, CodingKey {
        case paddingLeft = "left"
        case paddingRight = "right"
        case top, bottom
    }
}

// MARK: - ElementStyle
struct ScreenElementStyle: Decodable {
    let color: String?
    let fontSize: Int?
    let backgroundColor: String?
}

// MARK: - Title
struct ScreenTitle: Decodable {
    let text: String?
    let style: ScreenTitleStyle
}

// MARK: - TitleStyle
struct ScreenTitleStyle: Decodable {
    let color: String?
    let fontSize: Int?
}
