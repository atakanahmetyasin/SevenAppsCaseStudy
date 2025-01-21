//
//  UI+Extension.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 20.01.2025.
//

import UIKit

extension UILabel {
    static func createLabel(color: UIColor, font: UIFont, text: String, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.text = text
        label.font = font
        label.numberOfLines = 0
        label.textAlignment = alignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
