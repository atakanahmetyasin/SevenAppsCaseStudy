//
//  ContentType.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 19.01.2025.
//

import Foundation

enum ContentType {
    case json
    case multipartFromData

    var rawValue: String{
        switch self {
        case .json:
            "application/json"
        case .multipartFromData:
            ""
        }
    }
}
