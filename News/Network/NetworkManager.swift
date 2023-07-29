//
//  NetworkManager.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getSources(for category: String, completion: @escaping (Result<Data, Error>) -> Void) {
        do {
            let request = try NetworkRouter.getSources(category: category).request()
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    completion(.success(data))
                } else {
                    print("ERROR")
                }
            }
            
            task.resume()
        } catch {
            completion(.failure(error))
        }
    }
}




