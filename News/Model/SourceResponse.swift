//
//  SourceResponse.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//

import Foundation

// MARK: - SourceResponse
struct SourceResponse: Codable, Hashable {
    let status: String
    let sources: [Source]
}

// MARK: - Source
struct Source: Codable, Hashable {
    let id, name, sourceDescription: String
    let url: String
    let category, language, country: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case sourceDescription = "description"
        case url, category, language, country
    }
}
