//
//  NetworkRouter.swift
//  News
//
//  Created by ITUMAC03 on 29/07/23.
//

import Foundation
import Alamofire

enum NetworkRouter: NetworkConfiguration {
    case getSources(category: String)
    
    var method: HTTPMethod {
        switch self {
        case .getSources:
            return .get
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getSources(let category):
            return.url(["category": category, "apiKey":"4a27365f23b24d8eb502b59016e31f07" ])
        }
    }
    
    var path: String {
        switch self {
        case .getSources:
            return "/sources"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        //Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        //Parameters
        
        switch parameters {
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        case .url(let params):
            let queryParams = params.map { pair in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        }
        return urlRequest
    }
    
}
