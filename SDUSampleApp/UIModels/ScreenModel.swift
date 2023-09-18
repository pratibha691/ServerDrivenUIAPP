//
//  ScreenModel.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import Foundation

struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}
 
struct ComponentModel: Decodable {
    let type: ComponentType?
    let style: StyleAtrributeModel?
}
enum ComponentType: String, Decodable {
    case lable
    case textfield
    case button
}
struct StyleAtrributeModel: Decodable {
    let textColor: String?
    let fontSize: Int?
}

