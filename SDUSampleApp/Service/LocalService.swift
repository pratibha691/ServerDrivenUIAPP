//
//  LocalService.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import Foundation

class LocalService: NetworkServiceProtocol {
    
    func load<T: Decodable>(_ resourceName: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            completion(.failure(NSError(domain: "YourAppErrorDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "Resource file \(resourceName) not found!"])))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }

}
