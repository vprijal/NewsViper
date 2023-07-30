//
//  NetworkConfiguration.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//

import Foundation
import Alamofire

protocol NetworkConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
}
