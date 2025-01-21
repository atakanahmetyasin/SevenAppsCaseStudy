//
//  Users+Request.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 19.01.2025.
//

import Foundation

public extension API {
    enum Users: Networkable {
        case users
        
        public func request() async -> URLRequest {
            switch self {
            case .users:
                await getRequest(path: "users", httpMethod: .get)

            }
        }
    }
}
