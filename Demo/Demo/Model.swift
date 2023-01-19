//
//  Model.swift
//  Demo
//
//  Created by Rajkumar on 19/01/23.
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
// MARK: - Welcome
struct Welcome: Codable {
    let success: Bool
    let msg: String
    let imageData: [ImageDatum]
}

// MARK: - ImageDatum
struct ImageDatum: Codable {
    let image, name: String
    let imageDetail: [ImageDetail]
}

// MARK: - ImageDetail
struct ImageDetail: Codable {
    let image, name, detail: String
}

