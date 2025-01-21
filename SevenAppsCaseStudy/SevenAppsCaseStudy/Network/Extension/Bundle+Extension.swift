//
//  Bundle+Extension.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 19.01.2025.
//

import Foundation
public extension Bundle {
    func infoForKey(_ key: String) -> String? {
        (infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
}
