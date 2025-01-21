//
//  NetworkingError.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 19.01.2025.
//

import Foundation

public enum NetworkingError: Error {
    case invalidResponse
    case unauthorized
    case badRequest
    case serverError
    case decodingError
    case unknownError

    public var errorMessage: String {
        switch self {
        case .invalidResponse:
            return "Invalid Response from Server"
        case .unauthorized:
            return "Unauthorized Access"
        case .badRequest:
            return "Bad Request occurred"
        case .serverError:
            return "Internal Server Error occurred"
        case .decodingError:
            return "Failed to decode the data"
        case .unknownError:
            return "An unknown error occurred"
        }
    }
}
