//
//  URL+Extension.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 19.01.2025.
//

import Foundation

public extension URL {
    func adding(parameters: [String: String]) -> URL {
        guard parameters.count > 0 else {return self}
        var queryItems: [URLQueryItem] = []
        for parameter in parameters {
            queryItems.append(URLQueryItem(name: parameter.key, value: parameter.value))
        }
         return adding(queryItems: queryItems)
    }

    private func adding(queryItems: [URLQueryItem]) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else {
            fatalError("Could not create URLComponents")
        }

        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            fatalError("Could not create URL")
        }
        return url
    }
}
