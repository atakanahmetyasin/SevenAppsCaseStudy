//
//  NSError.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 19.01.2025.
//

import Foundation
public extension NSError {
    static var generic: Error {
        NSError(domain: "", code: -1, userInfo: [:] )
    }

    static func genericError(message: String) -> NSError {
        NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
