//
//  NetworkRouter.swift
//  News
//
//  Created by ITUMAC03 on 29/07/23.
//

import Foundation

enum NetworkRouter {
    case getSources(category: String)
    
    private static let baseUrlString = "https://newsapi.org/v2"

    
    private enum HTTPMethod {
        case get
        
        var value: String {
            switch self {
            case .get: return "GET"
            }
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getSources:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getSources(let category):
            return "/sources?category\(category)?apiKey=4a27365f23b24d8eb502b59016e31f07"
        }
    }
    
    func request() throws -> URLRequest {
        let urlString = "\(NetworkRouter.baseUrlString)\(path)"
        let components = URLComponents(string: urlString)!
        
        guard let url = components.url else {
            throw ErrorType.parseUrlFail
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = method.value
        
        switch self {
        case .getSources:
            return request
        }
    }
    
}

enum ErrorType: LocalizedError {
    case parseUrlFail
    
    var errorDescription: String? {
        switch self {
        case .parseUrlFail:
            return "Cannot initial URL object"
        }
    }
}
