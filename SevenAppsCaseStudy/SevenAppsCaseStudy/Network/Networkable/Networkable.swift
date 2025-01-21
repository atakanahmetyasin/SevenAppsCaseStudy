//
//  Networkable.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 19.01.2025.
//

import Foundation

public protocol Networkable {
    func request() async -> URLRequest
}

public extension Networkable {
    func fetch<T: Decodable>(requestModel model: T.Type) async -> Result<T, NetworkingError> {
        do {
            let (data, response) = try await URLSession.shared.data(for: request(), delegate: nil)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            
            switch response.statusCode {
            case 400:
                return .failure(.badRequest)
                
            case 500:
                return .failure(.serverError)
                
            case 401:
                return .failure(.unauthorized)
                
            default:
                if let json = try? JSONSerialization.jsonObject(with: data, options:  .mutableContainers),
                   let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                    print("---------------------------------")
                    print("---------------------------------")
                    print(String(decoding: jsonData, as: UTF8.self))
                    print("---------------------------------")
                    print("---------------------------------")
                }
                if model.self is Data.Type {
                    return .success(data as! T)
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                do {
                    let decodedData = try decoder.decode(T.self, from: data)
                    return .success(decodedData)
                } catch {
                    print("Decoding error: ", error.localizedDescription)
                    return .failure(.decodingError)
                }
            }
        } catch {
            print("Error: ", error.localizedDescription)
            return .failure(.unknownError)
        }
    }
}

