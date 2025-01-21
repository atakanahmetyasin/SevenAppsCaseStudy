//
//  API.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 19.01.2025.
//

import Foundation

public enum API {
    static func prepareUrl(withPath path: String) -> URL {
        guard let baseURL = Bundle.main.infoForKey("BASE_URL") else {
            fatalError("Could not create BaseURL")
        }
        guard let url = URL(string: "\(baseURL)\(path)") else {
            fatalError("Could not create url")
        }

        return url
    }

    static func getHeader(contentType: ContentType) -> [String: String] {
        var headers: [String: String] = [:]
      //  headers["Authorization"] = "Bearer \()"
        headers["Content-Type"] = contentType.rawValue
        return headers
    }
}
