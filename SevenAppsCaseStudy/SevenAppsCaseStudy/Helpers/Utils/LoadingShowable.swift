//
//  LoadingShowable.swift
//  SevenAppsCaseStudy
//
//  Created by Ahmet Yasin Atakan on 18.01.2025.
//

import UIKit

// LoadingShowable only can be conformed to UIViewcontroller and LoadingShowable can access its methods.
protocol LoadingShowable where Self: UIViewController { // Conditional protocol
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {
    func showLoading() {
        LoadingView.shared.startLoading()
    }
    
    func hideLoading() {
        LoadingView.shared.hideLoading()
    }
}
