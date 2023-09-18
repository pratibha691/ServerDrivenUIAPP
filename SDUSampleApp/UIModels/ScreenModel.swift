//
//  ScreenModel.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import Foundation

// MARK: - ScreenModel
struct ScreenModel: Decodable {
    let screen: String?
    let title: ScreenTitle?
    let elements: [ScreenElement]?
}

// MARK: - Element
struct ScreenElement: Decodable {
    let type: ComponentType?
    let text: String?
    let style: ScreenElementStyle
    let placeholder, key: String?
    let secure: Bool?
    let action: String?
}

enum ComponentType: String, Decodable {
    case lable
    case textfield
    case button
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
